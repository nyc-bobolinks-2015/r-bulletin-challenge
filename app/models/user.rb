class User < ActiveRecord::Base
  has_secure_password
  has_many :messages
  has_many :conversations
  has_many :likes
  has_many :liked_messages, through: :likes, source: :message
  validates :email, presence: true
end
