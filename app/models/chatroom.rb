class Chatroom < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :participants, dependent: :destroy
    after_create_commit { broadcast_if_public }
    validates :name, presence: true
    validates_uniqueness_of :name
    scope :public_rooms, -> { where(is_private: false) }
    after_create_commit {broadcast_append_to "chatrooms"}
    def broadcast_if_public
        broadcast_append_to "chatrooms" unless self.is_private
      end
      
      def self.create_private_room(users, chatroom_name)
        single_room = Chatroom.create(name: chatroom_name, is_private: true)
        users.each do |user|
          Participant.create(user_id: user.id, chatroom_id: single_room.id )
        end
        single_room
      end
end
