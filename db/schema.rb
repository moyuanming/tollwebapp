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

ActiveRecord::Schema.define(version: 20140915094037) do

  create_table "Table1", id: false, force: true do |t|
    t.string "sf",  limit: 10
    t.string "dfs", limit: 10
    t.string "sdf", limit: 10
  end

  create_table "gljdaimas", force: true do |t|
    t.string   "name"
    t.string   "no"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pianqudaima_id"
  end

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "pianqudaimas", force: true do |t|
    t.string   "name"
    t.string   "no"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "tollstationips", force: true do |t|
    t.string   "oldnetwork"
    t.string   "oldplaza"
    t.string   "oldip"
    t.string   "newnetwork"
    t.string   "newplaza"
    t.string   "newip"
    t.integer  "tollstation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tollstations", force: true do |t|
    t.string   "name"
    t.integer  "pianqudaima_id"
    t.integer  "gljdaima_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
