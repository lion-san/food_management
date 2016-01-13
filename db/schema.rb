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

ActiveRecord::Schema.define(version: 20160113000250) do

  create_table "alerts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_logs", force: true do |t|
    t.integer  "user_id"
    t.string   "event_type"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.integer  "store_id"
    t.integer  "category_id"
    t.string   "item_detail"
    t.binary   "thumbnail"
    t.string   "thumbnail_content_type"
    t.datetime "standard_best_before_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "use_thumbnail",             default: false
  end

  create_table "stocks", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.integer  "user_item_id"
    t.integer  "item_status_id"
    t.integer  "item_location_id"
    t.integer  "price",            default: 0
    t.datetime "purchase_date"
    t.datetime "best_before_date"
    t.integer  "delete_status",    default: 0
    t.integer  "alert_id"
    t.integer  "alert_is_read",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  create_table "stores", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_items", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "category_id"
    t.string   "item_detail"
    t.binary   "thumbnail"
    t.string   "thumbnail_content_type"
    t.datetime "standard_best_before_date"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "use_thumbnail",             default: false
  end

  create_table "user_utils", force: true do |t|
    t.integer  "user_id"
    t.integer  "point"
    t.integer  "reset"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "wishes", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.integer  "user_item_id"
    t.string   "memo"
    t.integer  "price"
    t.integer  "delete_status", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
