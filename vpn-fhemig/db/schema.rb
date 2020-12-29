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

ActiveRecord::Schema.define(version: 2020_08_20_170200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "vpn_importations", force: :cascade do |t|
    t.string "estacao_camg"
    t.string "ip_renovado"
    t.string "patrimonio"
    t.string "mac"
    t.string "host_name"
  end

  create_table "vpns", force: :cascade do |t|
    t.string "entidade"
    t.string "unidade"
    t.string "nome"
    t.string "cpf"
    t.string "justificativa"
    t.string "ip_antigo"
    t.string "estacao_camg"
    t.string "estacao_camg_renovada"
    t.string "ip_renovado"
    t.boolean "feito", default: false
    t.text "observacao"
  end

end
