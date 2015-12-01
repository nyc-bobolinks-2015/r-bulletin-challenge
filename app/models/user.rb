class User < ActiveRecord::Base
  has_secure_password
  has_many :messages
  has_many :conversations

  def recent_messages
    self.messages.order(created_at: :desc).limit(10)
  end
end
