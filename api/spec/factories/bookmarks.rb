FactoryBot.define do
  factory :bookmark do
    association :range_outline
    association :user
  end
end
