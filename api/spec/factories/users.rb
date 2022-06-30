FactoryBot.define do
  factory :user do
    provider { "email" }
    sequence(:name) { |n| "Test User#{n}" }
    sequence(:uid) { |n| "testuser#{n}@example.com" }
    email { uid }
    sequence(:phone_number) {|n| "090-1234-12#{n}" }
    password { "password." }
  end
end
