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

ActiveRecord::Schema.define(version: 20160224161614) do

  create_table "alts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "wow_name",   limit: 255
    t.integer  "wow_class",  limit: 1,   default: 0
    t.integer  "wow_region", limit: 1,   default: 0
    t.string   "wow_server", limit: 255
    t.string   "wow_spec",   limit: 255
    t.string   "avatar",     limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "guild_applications", force: :cascade do |t|
    t.string   "wow_name",   limit: 255
    t.string   "email",      limit: 255
    t.integer  "status",     limit: 1,     default: 0
    t.integer  "wow_region", limit: 1,     default: 0
    t.string   "wow_server", limit: 255
    t.integer  "wow_class",  limit: 1,     default: 0
    t.string   "wow_spec",   limit: 255
    t.string   "firstname",  limit: 255
    t.string   "lastname",   limit: 255
    t.string   "phone",      limit: 255
    t.text     "q_1",        limit: 65535
    t.text     "q_2",        limit: 65535
    t.text     "q_3",        limit: 65535
    t.text     "q_4",        limit: 65535
    t.text     "q_5",        limit: 65535
    t.text     "q_6",        limit: 65535
    t.text     "q_7",        limit: 65535
    t.text     "q_8",        limit: 65535
    t.string   "raid_ui",    limit: 255
    t.integer  "age",        limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "body",        limit: 65535
    t.integer  "permissions", limit: 1,     default: 0
    t.integer  "views",       limit: 4
    t.integer  "status",      limit: 1,     default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "status",       limit: 1,     default: 0
    t.string   "title",        limit: 255
    t.text     "body",         limit: 65535
    t.integer  "views",        limit: 4,     default: 0
    t.datetime "published_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "wow_region", limit: 1,   default: 0
    t.string   "wow_server", limit: 255
    t.integer  "wow_class",  limit: 1,   default: 0
    t.string   "firstname",  limit: 255
    t.string   "lastname",   limit: 255
    t.string   "phone",      limit: 255
    t.string   "avatar",     limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "remember_digest", limit: 255
  end

  add_index "users", ["email", "name"], name: "index_users_on_email_and_name", unique: true, using: :btree

end
