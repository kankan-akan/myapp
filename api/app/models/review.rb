class Review < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
  belongs_to :reservation
end
