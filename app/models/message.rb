class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  def get_message_intro
    self.content[0..50]
  end
end
