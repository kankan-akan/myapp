FactoryBot.define do
  factory :admin_range do
    provider { "email" }
    sequence(:name) { |n| "Example#{n}練習場" }
    sequence(:uid) { |n| "Test#{n}@example.com" }
    email { uid }
    password { "password." }
  end
end
