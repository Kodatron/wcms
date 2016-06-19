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

ActiveRecord::Schema.define(version: 20160617180506) do

  create_table "alt_requests", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "character_id", limit: 4
    t.string   "reason",       limit: 255
    t.integer  "status",       limit: 1,   default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "armory_updates", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "characters", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "name",        limit: 255
    t.integer  "level",       limit: 4,   default: 1
    t.integer  "wow_region",  limit: 1,   default: 0
    t.string   "wow_server",  limit: 255
    t.integer  "wow_class",   limit: 1,   default: 0
    t.integer  "wow_spec",    limit: 1,   default: 0
    t.string   "avatar_url",  limit: 255
    t.string   "profile_url", limit: 255
    t.integer  "state",       limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "enchants", force: :cascade do |t|
    t.integer  "gear_id",    limit: 4
    t.integer  "wow_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "gears", force: :cascade do |t|
    t.integer  "character_id",  limit: 4
    t.integer  "item_id",       limit: 4
    t.string   "name",          limit: 255
    t.string   "thumbnail",     limit: 255
    t.string   "bonus",         limit: 255
    t.string   "content",       limit: 255
    t.integer  "quality",       limit: 1,   default: 0
    t.integer  "ilvl",          limit: 4
    t.integer  "item",          limit: 1,   default: 0
    t.integer  "item_upgrades", limit: 4,   default: 0
    t.boolean  "active",                    default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
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

  create_table "servers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "locale",     limit: 255
    t.integer  "wow_region", limit: 1,   default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "set_pieces", force: :cascade do |t|
    t.integer  "gear_id",    limit: 4
    t.string   "wow_id",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "settings", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "locale",     limit: 1, default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",             limit: 255
    t.string   "firstname",         limit: 255
    t.string   "lastname",          limit: 255
    t.string   "phone",             limit: 255
    t.string   "password_digest",   limit: 255
    t.string   "remember_digest",   limit: 255
    t.string   "activation_digest", limit: 255
    t.integer  "activated",         limit: 4,   default: 0
    t.datetime "activated_at"
    t.string   "reset_digest",      limit: 255
    t.datetime "reset_sent_at"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "wow_gems", force: :cascade do |t|
    t.integer  "gear_id",    limit: 4
    t.string   "wow_id",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
