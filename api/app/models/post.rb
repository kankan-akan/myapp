class Post < ApplicationRecord
  belongs_to :user
  # validates :user_id, presence: true
  # validates :content, presence: true, length: {maximum: 140}
  mount_uploader :images, ImageUploader

  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
end
