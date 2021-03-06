# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160120200448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lots", force: :cascade do |t|
    t.string   "lot_code"
    t.date     "event_made"
    t.date     "event_shake"
    t.date     "event_chill"
    t.date     "event_remove"
    t.integer  "cycle_weeks"
    t.string   "units_type"
    t.string   "units_number"
    t.boolean  "active"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "strain_id"
    t.integer  "strain_code_id"
    t.integer  "user_id"
  end

  add_index "lots", ["strain_id"], name: "index_lots_on_strain_id", using: :btree
  add_index "lots", ["user_id"], name: "index_lots_on_user_id", using: :btree

  create_table "strains", force: :cascade do |t|
    t.string   "primary_key"
    t.string   "strain_code",     limit: 120
    t.string   "source_original", limit: 60
    t.string   "commercial_name", limit: 30
    t.string   "common_name",     limit: 60
    t.string   "latin_name",      limit: 90
    t.string   "form_received",   limit: 60
    t.date     "date_acquired"
    t.string   "photo_url",       limit: 600
    t.text     "notes"
    t.boolean  "completed",                   null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id",                     null: false
  end

  add_index "strains", ["user_id"], name: "index_strains_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "remember_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "lots", "strains"
  add_foreign_key "lots", "users"
  add_foreign_key "strains", "users"
end
