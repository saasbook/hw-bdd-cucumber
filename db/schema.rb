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

ActiveRecord::Schema.define(version: 20230922075739) do

  create_table "moviegoers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "full_name"
    t.string   "uid"
    t.string   "avatar_url"
    t.string   "provider"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "moviegoers", ["email"], name: "index_moviegoers_on_email", unique: true
  add_index "moviegoers", ["reset_password_token"], name: "index_moviegoers_on_reset_password_token", unique: true

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "rating"
    t.text     "description"
    t.datetime "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "potatoes"
    t.text     "comments"
    t.integer  "moviegoer_id"
    t.integer  "movie_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
