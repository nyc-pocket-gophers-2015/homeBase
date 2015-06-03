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

ActiveRecord::Schema.define(version: 20150602184305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "start_time", null: false
    t.datetime "end_time",   null: false
    t.integer  "member_id"
    t.integer  "family_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "families", force: :cascade do |t|
    t.string   "surname",         null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "name",                                                                        null: false
    t.integer  "family_id",                                                                   null: false
    t.integer  "task_points", default: 0
    t.string   "color"
    t.string   "img_url",     default: "http://media.giphy.com/media/F5njAlGB0wpy/giphy.gif"
    t.datetime "created_at",                                                                  null: false
    t.datetime "updated_at",                                                                  null: false
  end

  create_table "rewards", force: :cascade do |t|
    t.string   "name",                        null: false
    t.integer  "cost",                        null: false
    t.string   "category"
    t.integer  "family_id",                   null: false
    t.integer  "member_id",                   null: false
    t.string   "status",     default: "open"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title",                               null: false
    t.integer  "point_value",                         null: false
    t.integer  "family_id",                           null: false
    t.integer  "assigned_member_id"
    t.integer  "completed_member_id"
    t.boolean  "complete",            default: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

end
