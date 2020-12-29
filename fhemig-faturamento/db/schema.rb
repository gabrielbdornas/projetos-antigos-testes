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

ActiveRecord::Schema.define(version: 2020_08_19_235200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hospital_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.bigint "hospital_group_id"
    t.string "initial"
    t.string "name"
    t.string "revenue_name"
    t.string "city"
    t.string "regionalization"
    t.string "port"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospital_group_id"], name: "index_hospitals_on_hospital_group_id"
  end

  create_table "out_syntheses", force: :cascade do |t|
    t.bigint "hospital_id"
    t.bigint "procedure_id"
    t.date "competence"
    t.integer "sheet"
    t.integer "sequence"
    t.string "cbo"
    t.integer "quantity_presented"
    t.float "value_presented"
    t.integer "quantity__approved"
    t.float "value_approved"
    t.string "situation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospital_id"], name: "index_out_syntheses_on_hospital_id"
    t.index ["procedure_id"], name: "index_out_syntheses_on_procedure_id"
  end

  create_table "procedure_groups", force: :cascade do |t|
    t.string "cod"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "procedure_sub_groups", force: :cascade do |t|
    t.bigint "procedure_group_id"
    t.string "cod"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["procedure_group_id"], name: "index_procedure_sub_groups_on_procedure_group_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.bigint "procedure_sub_group_id"
    t.string "cod"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["procedure_sub_group_id"], name: "index_procedures_on_procedure_sub_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
