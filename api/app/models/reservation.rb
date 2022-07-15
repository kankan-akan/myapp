class Reservation < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
  has_one :review
end
