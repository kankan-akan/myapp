class Lesson < ApplicationRecord
  belongs_to :admin_range
  belongs_to :range_outline

  has_many :reviews, dependent: :destroy

  has_many :users, through: :reservations
  has_many :reservations
end
