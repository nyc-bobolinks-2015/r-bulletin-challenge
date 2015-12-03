class Message < ActiveRecord::Base
  belongs_to :conversation, touch: true
  belongs_to :user
  has_many  :likes

  validates :content, presence: true

  delegate :username, to: :user, prefix: false, allow_nil: true

  def in_caps
    content.upcase if content
  end

  def score
    self.likes.count
  end

  def liked_by_user?(current_user)
    Like.where(user: current_user, message: self).count > 0
  end
end
