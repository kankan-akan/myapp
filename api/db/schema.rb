# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_26_075710) do

  create_table "admin_ranges", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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

  create_table "equipment", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "uchihoudai", default: false, null: false
    t.boolean "approach", default: false, null: false
    t.boolean "lefty", default: false, null: false
    t.boolean "patting", default: false, null: false
    t.boolean "bunker", default: false, null: false
    t.boolean "shop", default: false, null: false
    t.boolean "restaurant", default: false, null: false
    t.boolean "lesson", default: false, null: false
    t.bigint "range_outline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["range_outline_id"], name: "index_equipment_on_range_outline_id"
  end

  create_table "lessons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "range_outlines", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "city"
    t.string "name"
    t.text "features"
    t.string "link"
    t.string "address"
    t.string "phone_number"
    t.string "distance"
    t.string "booths"
    t.bigint "admin_range_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_range_id"], name: "index_range_outlines_on_admin_range_id"
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "review"
    t.float "rate"
    t.bigint "lesson_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_reviews_on_lesson_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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
    t.string "image"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token"
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider"
  end

  add_foreign_key "equipment", "range_outlines"
  add_foreign_key "lessons", "admin_ranges"
  add_foreign_key "lessons", "range_outlines"
  add_foreign_key "posts", "users"
  add_foreign_key "range_outlines", "admin_ranges"
  add_foreign_key "reviews", "lessons"
  add_foreign_key "reviews", "users"
end
