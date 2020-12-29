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

ActiveRecord::Schema.define(version: 2020_08_22_133745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "summary"
    t.string "picture_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_description"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itens", force: :cascade do |t|
    t.string "siad_code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "summary"
    t.string "picture_url"
    t.string "reading_time"
    t.boolean "draft", default: true
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "supplies", force: :cascade do |t|
    t.bigint "iten_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["iten_id"], name: "index_supplies_on_iten_id"
    t.index ["user_id"], name: "index_supplies_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.bigint "course_id"
    t.integer "course_order"
    t.string "title"
    t.string "summary"
    t.string "reading_time"
    t.string "picture_url"
    t.text "content"
    t.boolean "boolean", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_topics_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.boolean "admin", default: false
    t.bigint "hospital_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["hospital_id"], name: "index_users_on_hospital_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "courses", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "supplies", "itens"
  add_foreign_key "supplies", "users"
  add_foreign_key "topics", "courses"
  add_foreign_key "users", "hospitals"
end