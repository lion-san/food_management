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

ActiveRecord::Schema.define(version: 20150622071605) do

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

  create_table "events", force: true do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.integer  "is_read"
    t.integer  "item_comment_id"
    t.integer  "exchange_comment_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exchange_comments", force: true do |t|
    t.integer  "exchange_id"
    t.integer  "user_id"
    t.string   "comment"
    t.integer  "del"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exchange_methods", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exchanges", force: true do |t|
    t.integer  "item_id"
    t.integer  "buyer_id"
    t.integer  "status"
    t.integer  "appraisal"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_comments", force: true do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.string   "comment"
    t.integer  "del"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "like"
    t.integer  "price"
    t.binary   "thumbnail"
    t.binary   "picture1"
    t.binary   "picture2"
    t.binary   "picture3"
    t.binary   "picture4"
    t.string   "item_detail"
    t.integer  "category_id"
    t.integer  "item_status_id"
    t.integer  "exchange_method_id"
    t.datetime "exchange_date"
    t.integer  "del"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
