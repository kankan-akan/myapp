class Calendar < ApplicationRecord
  belongs_to :lesson, inverse_of: :calendar
end
