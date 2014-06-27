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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20140627152835) do
=======
ActiveRecord::Schema.define(version: 20140626150646) do
>>>>>>> f8ce57ea96557b3a83ce45fd9ee2993b2b1cd255

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breweries", force: true do |t|
    t.string   "name",         null: false
    t.text     "description",  null: false
    t.string   "address",      null: false
    t.string   "state",        null: false
    t.string   "city",         null: false
    t.string   "zip",          null: false
    t.string   "hours"
    t.integer  "user_id"
    t.string   "phone_number", null: false
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "breweries", ["name", "city"], name: "index_breweries_on_name_and_city", unique: true, using: :btree

  create_table "products", force: true do |t|
    t.string   "name",       null: false
    t.integer  "type_id"
    t.integer  "brewery_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.string   "title",      null: false
    t.text     "body",       null: false
    t.integer  "rating",     null: false
    t.integer  "brewery_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["user_id", "brewery_id"], name: "index_reviews_on_user_id_and_brewery_id", using: :btree

  create_table "types", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name",                              null: false
    t.string   "last_name",                               null: false
    t.string   "role",                   default: "user", null: false
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "profile_photo"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "score",      default: 0
    t.integer  "user_id",                null: false
    t.integer  "review_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["user_id", "review_id"], name: "index_votes_on_user_id_and_review_id", unique: true, using: :btree

end
