class Lesson < ApplicationRecord
  belongs_to :admin_range
  belongs_to :range_outline

  has_many :reviews, dependent: :destroy

  has_many :reservations
  has_many :users, through: :reservations

  has_one :calendar, dependent: :destroy, inverse_of: :lesson
  accepts_nested_attributes_for :calendar
end
