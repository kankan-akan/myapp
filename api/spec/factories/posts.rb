FactoryBot.define do
  factory :post do
    sequence(:content) { |n| "example content#{n}" }

    association :user
  end
end
