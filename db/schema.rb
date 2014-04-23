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

ActiveRecord::Schema.define(version: 20140423031231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "body",              null: false
    t.integer  "parent_comment_id"
    t.integer  "restaurant_id"
    t.integer  "user_id",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["restaurant_id"], name: "index_comments_on_restaurant_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "restaurants", force: true do |t|
    t.string   "name",       null: false
    t.string   "subtitle"
    t.string   "street1",    null: false
    t.string   "street2"
    t.string   "city",       null: false
    t.string   "state",      null: false
    t.integer  "zip",        null: false
    t.integer  "owner_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurants", ["name"], name: "index_restaurants_on_name", using: :btree
  add_index "restaurants", ["owner_id"], name: "index_restaurants_on_owner_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "fname",           null: false
    t.string   "mname"
    t.string   "lname",           null: false
    t.string   "email",           null: false
    t.string   "city",            null: false
    t.string   "state",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["city", "state"], name: "index_users_on_city_and_state", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
