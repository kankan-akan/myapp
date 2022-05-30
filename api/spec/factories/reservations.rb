FactoryBot.define do
  factory :reservation do
    date { "1/23 10:00" }
    association :lesson 
    association :user
  end
end
