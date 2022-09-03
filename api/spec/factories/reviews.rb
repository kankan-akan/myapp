FactoryBot.define do
  factory :review do
    sequence(:title) { |n| "review-#{n}"}
    sequence(:content) { |n| "review content#{n}"}
    rate { 4.5 }
    association :reservation
    association :lesson
    association :user
  end
end
