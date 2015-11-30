class Conversation < ActiveRecord::Base
  belongs_to :topic
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :messages


  def self.recently_active_conversation
    Message.recently_added.map{|msg| msg.conversation}.uniq
  end

end
