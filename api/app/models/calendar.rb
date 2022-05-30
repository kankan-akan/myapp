class Calendar < ApplicationRecord
  belongs_to :lesson, inverse_of: :calendar
  serialize :start_time, Array
  serialize :holiday, Array
end
