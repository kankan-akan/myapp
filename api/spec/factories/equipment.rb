FactoryBot.define do
  factory :equipment do
    uchihoudai { true }
    approach { true }
    lefty { false }
    patting { false }
    bunker { false }
    shop { false }
    restaurant { false }
    lesson { false }
    association :admin_range
  end
end
