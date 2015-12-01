class Conversation < ActiveRecord::Base
  belongs_to :topic
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :messages
  has_one :category, through: :topic

def get_most_recent
  curr_messages = []
  self.messages.each do |m|
    if m.updated_at.to_date == Date.today
      curr_messages << m
    end
  end
  curr_messages
end

end
