FactoryBot.define do
  factory :reservation do
    date { "22/1/23(日)10:00" }
    association :lesson 
    association :user
  end
end
