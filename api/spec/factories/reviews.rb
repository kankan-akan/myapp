FactoryBot.define do
  factory :review do
    sequence(:review) { |n| "review content#{n}"}
    rate { 4.5 }
    sequence(:reservation_id) { |n| "#{n}"}
    association :lesson
    association :user
  end
end
