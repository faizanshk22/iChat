class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  after_create_commit { broadcast_append_to self.chatroom }
  before_create :confirm_participant

  def confirm_participant
    if self.chatroom.is_private
      is_participant = Participant.where(user_id: self.user.id, chatroom_id: self.chatroom.id).first
      throw :abort unless is_participant
    end
  end

end
