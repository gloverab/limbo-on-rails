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

ActiveRecord::Schema.define(version: 20170518201207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avatars", force: :cascade do |t|
    t.string  "name"
    t.string  "image_path"
    t.boolean "generic",    default: false
  end

  create_table "decisions", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "user_id"
    t.datetime "deadline"
    t.integer  "hours"
    t.integer  "minutes"
    t.string   "option_1"
    t.string   "option_2"
    t.integer  "author_id"
    t.integer  "discussion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discussions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "reason"
    t.integer  "author_id"
  end

  create_table "options", force: :cascade do |t|
    t.string  "content"
    t.integer "choice_number"
    t.integer "decision_id"
  end

  create_table "replies", force: :cascade do |t|
    t.string  "content"
    t.integer "discussion_id"
    t.integer "author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",             null: false
    t.string   "encrypted_password",     default: "",             null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,              null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.integer  "avatar_id"
    t.string   "provider"
    t.string   "uid"
    t.integer  "age"
    t.string   "image_path",             default: "Bee-icon.png"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "decision_id"
    t.integer  "option_id"
    t.integer  "voter_id"
    t.integer  "persuasion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
