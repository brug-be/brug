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

ActiveRecord::Schema.define(version: 20130605183030) do

  create_table "gatherings", force: true do |t|
    t.string   "name",        null: false
    t.string   "location",    null: false
    t.text     "description", null: false
    t.string   "kind",        null: false
    t.datetime "start_at",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id",    null: false
    t.string   "slug"
  end

  add_index "gatherings", ["slug"], name: "index_gatherings_on_slug", unique: true, using: :btree

  create_table "members", force: true do |t|
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_url"
  end

  create_table "participations", force: true do |t|
    t.integer  "member_id",    null: false
    t.integer  "gathering_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
