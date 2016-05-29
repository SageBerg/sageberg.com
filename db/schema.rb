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

ActiveRecord::Schema.define(version: 20160529161025) do

  create_table "teches", force: :cascade do |t|
    t.string   "name"
    t.integer  "times_used"
    t.string   "image_ref"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uses", force: :cascade do |t|
    t.integer  "tech_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "uses", ["tech_id"], name: "index_uses_on_tech_id"

  create_table "weeks", force: :cascade do |t|
    t.string   "name"
    t.decimal  "work_hours"
    t.string   "work_desc"
    t.decimal  "leisure_tech_hours"
    t.string   "leisure_desc"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
