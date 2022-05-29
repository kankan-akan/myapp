FactoryBot.define do
  factory :user do
    provider { "email" }
    sequence(:name) { |n| "Test User#{n}" }
    sequence(:uid) { |n| "testuser#{n}@example.com" }
    email { uid }
    password { "password." }
  end
end
