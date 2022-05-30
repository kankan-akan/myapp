FactoryBot.define do
  factory :review do
    sequence(:review) { |n| "review content#{n}"}
    rate { 4.5 }
    association :lesson
    association :user
  end
end
