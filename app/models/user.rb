class User < ApplicationRecord
  has_many :messages
  validates :full_name, presence: true
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }
  # Include default devise modules. Others available are:
   #:lockable, :timeoutable, :trackable and :omniauthable
  scope :online, -> {where("last_seen_at > ?", 30.seconds.ago)}
   devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
         def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.email = auth.info.email
            user.password = Devise.friendly_token[0, 20]
            user.full_name = auth.info.name 
            user.avatar_url = auth.info.image 
          end
        end
end
