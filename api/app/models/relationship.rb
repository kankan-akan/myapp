class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :user

  validates :user_id, presence: true
  validates :follower_id, presence: true
end
