FactoryBot.define do
  factory :like do
    association :post
    association :user
    # user { post.user }
  end
end
