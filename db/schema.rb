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

ActiveRecord::Schema.define(version: 2019_03_23_173357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classfield_images", force: :cascade do |t|
    t.bigint "classfield_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classfield_id"], name: "index_classfield_images_on_classfield_id"
  end

  create_table "classfields", force: :cascade do |t|
    t.string "offer_id", null: false, index: { unique: true }
    t.string "url"
    t.float "price"
    t.float "size"
    t.integer "rooms_count"
    t.integer "bedrooms"
    t.string "offer_type"
    t.string "district_area"
    t.text "full_description"
    t.string "energy_ratio"
    t.datetime "construction_date"
    t.integer "offer_view_count"
    t.string "agency"
    t.string "origin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
