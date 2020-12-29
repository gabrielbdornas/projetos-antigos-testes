# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_02_144320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.bigint "manteiner_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manteiner_id"], name: "index_brands_on_manteiner_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "course_configurations", force: :cascade do |t|
    t.bigint "unity_id", null: false
    t.bigint "course_id", null: false
    t.string "modality"
    t.boolean "status"
    t.integer "semesters_duration"
    t.string "period"
    t.decimal "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_course_configurations_on_course_id"
    t.index ["unity_id"], name: "index_course_configurations_on_unity_id"
  end

  create_table "courses", force: :cascade do |t|
    t.bigint "level_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["level_id"], name: "index_courses_on_level_id"
  end

  create_table "levels", force: :cascade do |t|
    t.bigint "sub_category_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sub_category_id"], name: "index_levels_on_sub_category_id"
  end

  create_table "manteiners", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sub_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "unities", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.string "name"
    t.string "state"
    t.string "city"
    t.string "neighborhood"
    t.string "address"
    t.string "zip_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_unities_on_brand_id"
  end

  add_foreign_key "brands", "manteiners"
  add_foreign_key "course_configurations", "courses"
  add_foreign_key "course_configurations", "unities"
  add_foreign_key "courses", "levels"
  add_foreign_key "levels", "sub_categories"
  add_foreign_key "sub_categories", "categories"
  add_foreign_key "unities", "brands"
end
