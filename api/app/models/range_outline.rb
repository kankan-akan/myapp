class RangeOutline < ApplicationRecord
  belongs_to :admin_range
  validates :admin_range_id, presence: true

  has_many :lessons, dependent: :destroy

  has_many :bookmarks, dependent: :destroy
end
