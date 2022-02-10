class Bookmark < ApplicationRecord
  belongs_to :range_outline
  belongs_to :user
end
