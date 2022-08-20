# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_09_155814) do

  create_table "admin_ranges", charset: "utf8", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_admin_ranges_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admin_ranges_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_ranges_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_admin_ranges_on_uid_and_provider", unique: true
  end

  create_table "bookmarks", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "range_outline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["range_outline_id"], name: "index_bookmarks_on_range_outline_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "calendars", charset: "utf8", force: :cascade do |t|
    t.string "lesson_time"
    t.string "start_time1"
    t.string "start_time2"
    t.string "start_time3"
    t.string "start_time4"
    t.string "start_time5"
    t.string "start_time6"
    t.string "start_time7"
    t.string "start_time8"
    t.string "start_time9"
    t.string "start_time10"
    t.string "start_time11"
    t.string "start_time12"
    t.string "sun"
    t.string "mon"
    t.string "tue"
    t.string "wed"
    t.string "thu"
    t.string "fri"
    t.string "sat"
    t.bigint "lesson_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_calendars_on_lesson_id"
  end

  create_table "equipment", charset: "utf8", force: :cascade do |t|
    t.boolean "uchihoudai", default: false, null: false
    t.boolean "approach", default: false, null: false
    t.boolean "lefty", default: false, null: false
    t.boolean "patting", default: false, null: false
    t.boolean "bunker", default: false, null: false
    t.boolean "shop", default: false, null: false
    t.boolean "restaurant", default: false, null: false
    t.boolean "lesson", default: false, null: false
    t.bigint "admin_range_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_range_id"], name: "index_equipment_on_admin_range_id"
  end

  create_table "lessons", charset: "utf8", force: :cascade do |t|
    t.string "title"
    t.string "coach"
    t.text "content"
    t.bigint "admin_range_id"
    t.bigint "range_outline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_range_id"], name: "index_lessons_on_admin_range_id"
    t.index ["range_outline_id"], name: "index_lessons_on_range_outline_id"
  end

  create_table "likes", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id", "post_id"], name: "index_likes_on_user_id_and_post_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "posts", charset: "utf8", force: :cascade do |t|
    t.text "content"
    t.string "range"
    t.string "image"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "range_outlines", charset: "utf8", force: :cascade do |t|
    t.string "city"
    t.string "name"
    t.text "features"
    t.string "link"
    t.string "address"
    t.string "phone_number"
    t.string "distance"
    t.string "booths"
    t.string "image"
    t.bigint "admin_range_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_range_id"], name: "index_range_outlines_on_admin_range_id"
  end

  create_table "relationships", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "follower_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
    t.index ["user_id", "follower_id"], name: "index_relationships_on_user_id_and_follower_id", unique: true
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "reservations", charset: "utf8", force: :cascade do |t|
    t.bigint "lesson_id"
    t.bigint "user_id"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_reservations_on_lesson_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", charset: "utf8", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.float "rate"
    t.integer "reservation_id", null: false
    t.bigint "lesson_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_reviews_on_lesson_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "user_id"
    t.string "email"
    t.string "phone_number"
    t.string "avatar"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "bookmarks", "range_outlines"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "calendars", "lessons"
  add_foreign_key "equipment", "admin_ranges"
  add_foreign_key "lessons", "admin_ranges"
  add_foreign_key "lessons", "range_outlines"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "range_outlines", "admin_ranges"
  add_foreign_key "relationships", "users", column: "follower_id"
  add_foreign_key "reservations", "lessons"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "lessons"
  add_foreign_key "reviews", "users"
end
