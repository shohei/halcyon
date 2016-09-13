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

ActiveRecord::Schema.define(version: 20160913094055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "footprints", force: :cascade do |t|
    t.string   "name"
    t.decimal  "outward_width"
    t.decimal  "outward_depth"
    t.string   "unit"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "picks", force: :cascade do |t|
    t.integer  "tray_id"
    t.string   "designator"
    t.string   "footprint"
    t.decimal  "mid_x"
    t.decimal  "mid_y"
    t.decimal  "ref_x"
    t.decimal  "ref_y"
    t.decimal  "pad_x"
    t.decimal  "pad_y"
    t.string   "tb"
    t.decimal  "rotation"
    t.string   "comment"
    t.string   "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.integer  "board_id",     null: false
    t.integer  "footprint_id"
    t.string   "designator"
    t.string   "footprint"
    t.decimal  "mid_x"
    t.decimal  "mid_y"
    t.decimal  "ref_x"
    t.decimal  "ref_y"
    t.decimal  "pad_x"
    t.decimal  "pad_y"
    t.string   "tb"
    t.decimal  "rotation"
    t.string   "comment"
    t.string   "unit"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "trays", force: :cascade do |t|
    t.integer  "board_id"
    t.decimal  "width"
    t.decimal  "depth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                       null: false
    t.string   "password_digest",             null: false
    t.integer  "role",            default: 1, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
