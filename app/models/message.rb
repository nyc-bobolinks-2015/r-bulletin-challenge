class Message < ActiveRecord::Base
  belongs_to :conversation, touch: true
  belongs_to :user

  validates :content, presence: true

  delegate :username, to: :user, prefix: false, allow_nil: true

  def in_caps
    content.upcase if content
  end

  def self.my_recent(user)
    where(user_id: user.id).order(updated_at: :desc).limit(5)
  end

end
