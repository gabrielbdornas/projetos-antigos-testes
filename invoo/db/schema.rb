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

ActiveRecord::Schema.define(version: 2019_12_04_134335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chart_of_accounts", force: :cascade do |t|
    t.string "account_number"
    t.string "group"
    t.string "sub_group"
    t.string "account"
    t.string "nature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "group_number"
    t.string "sub_group_number"
  end

  create_table "companies", force: :cascade do |t|
    t.string "cnpj"
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "report_system"
    t.string "state"
    t.string "zipcode"
    t.string "address"
    t.string "number"
    t.string "district"
    t.string "city"
    t.string "complement"
    t.string "company_email"
    t.string "link"
  end

  create_table "company_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_users_on_company_id"
    t.index ["user_id"], name: "index_company_users_on_user_id"
  end

  create_table "import_accounts", force: :cascade do |t|
    t.bigint "import_info_id"
    t.string "client_account_number"
    t.bigint "cliente_account_reduction"
    t.string "client_account_description"
    t.float "before_balance"
    t.string "before_balance_type"
    t.float "debit"
    t.float "credit"
    t.float "balance"
    t.float "end_balance"
    t.string "end_balance_type"
    t.bigint "chart_of_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chart_of_account_id"], name: "index_import_accounts_on_chart_of_account_id"
    t.index ["import_info_id"], name: "index_import_accounts_on_import_info_id"
  end

  create_table "import_infos", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "company_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_user_id"], name: "index_import_infos_on_company_user_id"
  end

  create_table "import_syntetics", force: :cascade do |t|
    t.string "group"
    t.bigint "import_info_id"
    t.string "client_account_number"
    t.integer "cliente_account_reduction"
    t.string "client_account_description"
    t.float "before_balance"
    t.string "before_balance_type"
    t.float "debit"
    t.float "credit"
    t.float "balance"
    t.float "end_balance"
    t.string "end_balance_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["import_info_id"], name: "index_import_syntetics_on_import_info_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "link"
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_orders_on_company_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
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

  add_foreign_key "company_users", "companies"
  add_foreign_key "company_users", "users"
  add_foreign_key "import_accounts", "chart_of_accounts"
  add_foreign_key "import_accounts", "import_infos"
  add_foreign_key "import_infos", "company_users"
  add_foreign_key "import_syntetics", "import_infos"
  add_foreign_key "orders", "companies"
  add_foreign_key "orders", "users"
end
