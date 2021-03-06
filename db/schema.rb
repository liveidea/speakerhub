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

ActiveRecord::Schema.define(version: 20160302183610) do

  create_table "accounts", force: :cascade do |t|
    t.string   "f_name",           limit: 255
    t.string   "l_name",           limit: 255
    t.string   "phone",            limit: 255
    t.string   "facebook_account", limit: 255
    t.string   "skype_account",    limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "image",            limit: 255
    t.integer  "city_id",          limit: 4
  end

  create_table "accounts_themes", id: false, force: :cascade do |t|
    t.integer "theme_id",   limit: 4
    t.integer "account_id", limit: 4
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "description",      limit: 65535
    t.integer  "account_id",       limit: 4
    t.integer  "commentable_id",   limit: 4
    t.string   "commentable_type", limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "conferences", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "place",       limit: 255
    t.datetime "start_date"
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.date     "finish_date"
    t.boolean  "avaliable"
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "conference_id", limit: 4
    t.integer  "account_id",    limit: 4
    t.integer  "status",        limit: 4,   default: 0
    t.string   "message",       limit: 255
    t.string   "answer",        limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "speaches", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.text     "description",   limit: 65535
    t.datetime "date"
    t.string   "image",         limit: 255
    t.string   "video",         limit: 255
    t.integer  "user_id",       limit: 4
    t.integer  "conference_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "speeches", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.text     "description",   limit: 65535
    t.string   "place",         limit: 255
    t.datetime "date"
    t.string   "image",         limit: 255
    t.string   "video",         limit: 255
    t.integer  "user_id",       limit: 4
    t.integer  "conference_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "theme_id",      limit: 4
    t.boolean  "available"
  end

  create_table "themes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "f_name",                 limit: 255
    t.string   "l_name",                 limit: 255
    t.string   "phone",                  limit: 255
    t.string   "facebook_account",       limit: 255
    t.string   "skype_account",          limit: 255
    t.string   "login",                  limit: 255
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "account_id",             limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
