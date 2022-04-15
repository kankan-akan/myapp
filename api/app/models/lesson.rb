class Lesson < ApplicationRecord
  belongs_to :admin_range
  belongs_to :range_outline

  has_many :reviews, dependent: :destroy

  has_many :reservations
  has_many :users, through: :reservations
end
