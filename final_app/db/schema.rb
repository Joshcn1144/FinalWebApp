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

ActiveRecord::Schema[7.1].define(version: 2024_12_03_035949) do
  create_table "base_menus", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_base_menus_on_owner_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "item"
    t.text "description"
    t.decimal "price"
    t.boolean "available"
    t.integer "base_menu_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["base_menu_id"], name: "index_menu_items_on_base_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "item"
    t.text "description"
    t.decimal "price"
    t.boolean "available"
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_menus_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "company_name"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true
  end

  add_foreign_key "base_menus", "owners"
  add_foreign_key "menu_items", "base_menus"
  add_foreign_key "menus", "owners"
end
