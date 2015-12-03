class Like < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :message
  validates_uniqueness_of :message, scope: :user
end
