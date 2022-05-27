FactoryBot.define do
  factory :calendar do
    lesson_time { "60" }
    start_time1 { "11:00" }
    start_time2 { "12:00" }
    start_time3 { "14:00" }
    start_time4 { "15:00" }
    start_time5 { "16:00" }
    start_time6 { "17:00" }
    # start_time7 
    # start_time8
    # start_time9
    # start_time10
    # start_time11
    # start_time12
    sun { false }
    mon { false }
    tue { true }
    wen { true }
    thu { false }
    fri { false }
    sat { false }

    association :lesson
  end
end
