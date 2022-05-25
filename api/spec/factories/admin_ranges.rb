FactoryBot.define do
  factory :admin_range do
    provider { "email" }
    sequence(:name) { |n| "Example練習場#{n}" }
    sequence(:uid) { |n| "Test#{n}@example.com" }
    email { uid }
    password { "password." }
  end
end
