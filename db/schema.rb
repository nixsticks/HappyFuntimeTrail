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

ActiveRecord::Schema.define(version: 20140122174323) do

  create_table "addresses", force: true do |t|
    t.string  "line1"
    t.string  "line2"
    t.string  "city"
    t.string  "state"
    t.string  "zip"
    t.integer "pin_id"
  end

  create_table "audios", force: true do |t|
    t.integer  "user_id"
    t.integer  "pin_id"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents", force: true do |t|
    t.text    "text"
    t.integer "user_id"
    t.integer "pin_id"
  end

  create_table "images", force: true do |t|
    t.integer  "user_id"
    t.integer  "pin_id"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pins", force: true do |t|
    t.integer "stepnumber"
    t.string  "address"
    t.integer "trail_id"
    t.decimal "latitude"
    t.decimal "longitude"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "texts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "pin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trail_followers", force: true do |t|
    t.integer "trail_id"
    t.integer "follower_id"
  end

  create_table "trails", force: true do |t|
    t.integer  "length"
    t.integer  "popularity"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.string   "name"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.integer  "current_trail_id"
    t.integer  "current_pin_id"
    t.boolean  "god",              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "videos", force: true do |t|
    t.integer  "user_id"
    t.integer  "pin_id"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
