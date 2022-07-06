# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
  {
    name: "近藤太一",
    user_id: "taichi_kondo",
    email: "a@example.com",
    phone_number: "090-1234-1234",
    password: "password.",
    avatar: Rails.root.join('app/assets/images/avatar/youngman_25.png').open
  },
  {
    name: "田中俊介",
    user_id: "shun.tanaka",
    email: "b@examle.com",
    phone_number: "090-7980-7887",
    password: "password.",
    avatar: Rails.root.join('app/assets/images/avatar/golf_jou_man_edit.jpeg').open
  },
  {
    name: "佐藤はな",
    user_id: "flower_sato",
    email: "c@example.com",
    phone_number: "090-6789-6789",
    password: "password."
  }
])

Post.create!([
  {
    content: "examle post1",
    image: Rails.root.join('app/assets/images/post/IMG_1164_2.jpeg').open,
    user_id: 1
  },
  {
    content: "example post2",
    image: Rails.root.join('app/assets/images/post/IMG_2190.jpeg').open,
    user_id: 2
  },
  {
    content: "250ydくらいで広めの練習場だった。崖の上まで届くと300yd！\n待合室は冷房が効いていて快適。",
    image: Rails.root.join('app/assets/images/post/IMG_2138.jpg').open,
    user_id: 1
  },
  {
    content: "example post4",
    user_id: 3,
  },
  {
    content: "example post5",
    user_id: 3
  },
  {
    content: "examle post 6",
    user_id: 2
  }
])

AdminRange.create!(
  name: "hogeゴルフ練習場",
  email: "a@example.com",
  password: "password."
)

RangeOutline.create!(
  city: "神戸市",
  name: "hogeゴルフ練習場",
  features: "駐車場有",
  link: "www.example.com",
  address: "兵庫県神戸市中央区99-99",
  phone_number: "078-123-1234",
  distance: "250",
  booths: "70",
  admin_range_id: 1
)

Equipment.create!(
  uchihoudai: true,
  approach: true,
  lefty: true,
  patting: true,
  bunker: true,
  shop: false,
  restaurant: false,
  lesson: true,
  admin_range_id: 1
)

Lesson.create!([
  {
    title: "初心者向けレッスン",
    coach: "佐藤和雄", 
    content: "初心者におすすめのレッスンです。",
    admin_range_id: 1,
    range_outline_id: 1
  },
  {
    title: "中級者向けレッスン",
    coach: "田中花子",
    content: "100切りを目指したい方におすすめのレッスンです。",
    admin_range_id: 1,
    range_outline_id: 1 
  }
])

Calendar.create!([
  {
    lesson_time: "60",
    start_time1: "09:00", 
    start_time2: "10:00",
    tue: "火",
    wed: "水",
    lesson_id: 1
  },
  {
    lesson_time: "60",
    start_time1: "14:00",
    start_time2: "15:00",
    sun: "日",
    mon: "月",
    lesson_id: 2
  }
])

Reservation.create!([
  {
    lesson_id: 1,
    user_id: 1,
    date: "22/01/23(日)10:00"
  },
  {
    lesson_id: 1,
    user_id: 1,
    date: "22/06/30(木)09:00"
  }
])