FactoryBot.define do
  factory :range_outline do
    sequence(:city) { |n| "test#{n}市" }
    sequence(:name) { |n| "Example#{n}" }
    features { "example content" }
    link { "https://www.example.com" }
    address { "examle-city test99-99" }
    phone_number { "078-123-1234" }
    distance { "250" }
    booths { "70" }
    association :admin_range
  end
end
