# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

Lesson.create!(
  title: "初心者向けレッスン",
  coach: "佐藤和雄", 
  content: "初心者におすすめのレッスンです。",
  admin_range_id: 1,
  range_outline_id: 1,
  calendar_attributes: [
    lesson_time: "60",
    start_time: ["09:00", "10:00"],
    holiday: ["火", "水"]
  ]
)