class Conversation < ActiveRecord::Base
  belongs_to :topic
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :messages

  def self.recent(topic)
    Conversation.where("updated_at >= ? and topic_id = ?", Date.today, topic.id)
  end

  def self.old(topic)
    Conversation.where("updated_at < ? and topic_id = ?", Date.today, topic.id)
  end

end
