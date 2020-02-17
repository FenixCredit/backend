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

ActiveRecord::Schema.define(version: 2020_02_09_185739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "admins", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "photo"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "clients", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "client_type", default: 1
    t.string "street"
    t.string "external_number"
    t.string "internal_number"
    t.string "colony"
    t.uuid "user_id"
    t.uuid "promoter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "identification"
    t.string "address_proof"
    t.string "warning_letter"
    t.index ["promoter_id"], name: "index_clients_on_promoter_id"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "employees", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "contract"
    t.string "picture"
    t.integer "status", default: 1
    t.uuid "user_id"
    t.uuid "admin_id"
    t.uuid "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "salary", default: 0.0
    t.string "address"
    t.index ["admin_id"], name: "index_employees_on_admin_id"
    t.index ["role_id"], name: "index_employees_on_role_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "equipment", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.float "cost"
    t.string "photo"
    t.integer "type"
    t.uuid "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_equipment_on_admin_id"
  end

  create_table "guarantee_products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "promissory_note_id"
    t.uuid "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_guarantee_products_on_product_id"
    t.index ["promissory_note_id"], name: "index_guarantee_products_on_promissory_note_id"
  end

  create_table "guarantees", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "is_favourite", default: false
    t.string "street"
    t.string "external_number"
    t.string "internal_number"
    t.string "colony"
    t.string "identification"
    t.string "address_proof"
    t.string "warning_letter"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_guarantees_on_user_id"
  end

  create_table "loans", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.float "quantity", default: 0.0
    t.integer "status", default: 1
    t.string "period"
    t.uuid "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_loans_on_client_id"
  end

  create_table "payments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.float "quantity", default: 0.0
    t.integer "status", default: 1
    t.uuid "client_id"
    t.uuid "loan_id"
    t.uuid "promoter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_payments_on_client_id"
    t.index ["loan_id"], name: "index_payments_on_loan_id"
    t.index ["promoter_id"], name: "index_payments_on_promoter_id"
  end

  create_table "products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.float "value", default: 0.0
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promissory_notes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "file"
    t.string "code"
    t.uuid "loan_id"
    t.uuid "guarantee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guarantee_id"], name: "index_promissory_notes_on_guarantee_id"
    t.index ["loan_id"], name: "index_promissory_notes_on_loan_id"
  end

  create_table "promoters", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "aka"
    t.string "contract"
    t.uuid "user_id"
    t.uuid "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "comission", default: 7.0
    t.string "address"
    t.index ["employee_id"], name: "index_promoters_on_employee_id"
    t.index ["user_id"], name: "index_promoters_on_user_id"
  end

  create_table "roles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "token_type"
    t.string "content"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tokens_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.integer "gender"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "admins", "users"
  add_foreign_key "clients", "promoters"
  add_foreign_key "clients", "users"
  add_foreign_key "employees", "admins"
  add_foreign_key "employees", "roles"
  add_foreign_key "employees", "users"
  add_foreign_key "equipment", "admins"
  add_foreign_key "guarantee_products", "products"
  add_foreign_key "guarantee_products", "promissory_notes"
  add_foreign_key "guarantees", "users"
  add_foreign_key "loans", "clients"
  add_foreign_key "payments", "clients"
  add_foreign_key "payments", "loans"
  add_foreign_key "payments", "promoters"
  add_foreign_key "promissory_notes", "guarantees"
  add_foreign_key "promissory_notes", "loans"
  add_foreign_key "promoters", "employees"
  add_foreign_key "promoters", "users"
  add_foreign_key "tokens", "users"
end
