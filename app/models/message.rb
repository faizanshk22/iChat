class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  has_many_attached :attachments
  after_create_commit { broadcast_append_to self.chatroom }
  before_create :confirm_participant

  def chat_attachment(index)
   target = attachments[index]
   return unless attachments.attached?

   def process_attachments
    if image_attachments.attached?
      image_attachments.each do |attachment|
        ProcessImageService.new(attachment).resize_to_limit(150, 150).process
      end
    end
  end
end

class ProcessImageService
  def initialize(attachment)
    @attachment = attachment
  end

  def resize_to_limit(width, height)
    @resize_width = width
    @resize_height = height
    self
  end

  def process
    # Use MiniMagick to perform image processing
    # Example: Resize image to the specified dimensions
    @attachment.processed.download do |io|
      img = MiniMagick::Image.read(io)
      img.resize "#{@resize_width}x#{@resize_height}"
      io.write img.to_blob
    end
  end
end

  def confirm_participant
    if self.chatroom.is_private
      is_participant = Participant.where(user_id: self.user.id, chatroom_id: self.chatroom.id).first
      throw :abort unless is_participant
    end
  end

end
