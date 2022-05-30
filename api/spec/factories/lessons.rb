FactoryBot.define do
  factory :lesson do
    sequence(:title) { |n| "test lesson#{n}"}
    coach { "sato taro" }
    content { "example lesson content" }

    association :admin_range
    association :range_outline
  end
end
