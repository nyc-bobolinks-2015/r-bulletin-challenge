class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  def self.recently_added
    self.where("created_at > ?", self.last.created_at - 30.minutes)
  end
end
