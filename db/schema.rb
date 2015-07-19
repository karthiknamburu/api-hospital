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

ActiveRecord::Schema.define(version: 20150718125820) do

  create_table "chats", force: :cascade do |t|
    t.integer  "user_one_id", limit: 4
    t.integer  "user_two_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "chats", ["user_one_id"], name: "index_chats_on_user_one_id", using: :btree
  add_index "chats", ["user_two_id"], name: "index_chats_on_user_two_id", using: :btree

  create_table "departments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id",  limit: 4
    t.text     "body",       limit: 65535
    t.integer  "chat_id",    limit: 4
    t.datetime "created_at"
  end

  add_index "messages", ["chat_id"], name: "index_messages_on_chat_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "department_id", limit: 4
    t.string   "name",          limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "account_id",    limit: 255
    t.string   "secret_token",  limit: 255
  end

  add_index "users", ["account_id"], name: "index_users_on_account_id", using: :btree
  add_index "users", ["department_id"], name: "index_users_on_department_id", using: :btree
  add_index "users", ["secret_token"], name: "index_users_on_secret_token", using: :btree

end
