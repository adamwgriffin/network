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

ActiveRecord::Schema[8.0].define(version: 2025_09_11_014036) do
  create_table "companies", force: :cascade do |t|
    t.text "name", null: false
    t.text "headquarters", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.index ["slug"], name: "index_companies_on_slug", unique: true
  end

  create_table "connections", force: :cascade do |t|
    t.integer "requester_id", null: false
    t.integer "recipient_id", null: false
    t.string "status", default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_connections_on_recipient_id"
    t.index ["requester_id", "recipient_id"], name: "index_connections_on_requester_id_and_recipient_id", unique: true
    t.index ["requester_id"], name: "index_connections_on_requester_id"
    t.index ["status"], name: "index_connections_on_status"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "company_id", null: false
    t.text "first_name", null: false
    t.text "middle_name"
    t.text "last_name", null: false
    t.text "nickname"
    t.text "credentials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", null: false
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "connections", "users", column: "recipient_id"
  add_foreign_key "connections", "users", column: "requester_id"
  add_foreign_key "users", "companies"
end
