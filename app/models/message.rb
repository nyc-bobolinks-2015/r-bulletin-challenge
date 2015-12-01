class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

 def self.recent(user)
    Message.where("updated_at >= ? and user_id = ?", Date.today, user.id)
  end
end
