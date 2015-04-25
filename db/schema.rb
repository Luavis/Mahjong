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

ActiveRecord::Schema.define(version: 20150425075355) do

  create_table "abstract_records", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mh_logs", force: :cascade do |t|
    t.integer  "ranking_id",  null: false
    t.integer  "nickname_id", null: false
    t.integer  "point",       null: false
    t.integer  "grade",       null: false
    t.integer  "wind_type",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "mh_nickanmes", force: :cascade do |t|
    t.string   "nickname",                      null: false
    t.integer  "kml_id",                        null: false
    t.integer  "elo_point",      default: 1400
    t.integer  "standard_point", default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "mh_rankings", force: :cascade do |t|
    t.integer  "is_half",     default: 1
    t.boolean  "is_recorded", default: false
    t.integer  "log_1_id"
    t.integer  "log_2_id"
    t.integer  "log_3_id"
    t.integer  "log_4_id"
    t.boolean  "is_deleted",  default: false
    t.integer  "kml_id",                      null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
