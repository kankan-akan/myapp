class RangeOutline < ApplicationRecord
  belongs_to :admin_range
  validates :admin_range_id, presence: true
  has_one :equipment, dependent: :destroy

  has_many :lesson, dependent: :destroy
end
