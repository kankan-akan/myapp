FactoryBot.define do
  factory :relationship do
    association :user
    association :follower, factory: :user
  end
end
