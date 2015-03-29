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

ActiveRecord::Schema.define(version: 20150329192209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "city",          null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "state_code_id", null: false
  end

  create_table "country_codes", force: :cascade do |t|
    t.string   "country_code", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "food_categories", force: :cascade do |t|
    t.string   "category",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "menu_item",     null: false
    t.string   "price"
    t.integer  "restaurant_id", null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "neighborhood", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "photos", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
    t.integer  "width"
    t.integer  "height"
    t.string   "optimal_size"
  end

  create_table "postal_codes", force: :cascade do |t|
    t.string   "postal_code", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "city_id",     null: false
  end

  create_table "restaurant_menu_items", force: :cascade do |t|
    t.integer  "menu_item_id",  null: false
    t.integer  "restaurant_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "restaurant_menu_items", ["menu_item_id", "restaurant_id"], name: "index_restaurant_menu_items_on_menu_item_id_and_restaurant_id", unique: true, using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
    t.string   "phone"
    t.boolean  "is_closed"
    t.string   "url"
    t.string   "mobile_url"
    t.string   "snippet_text"
    t.string   "street_number"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "locality"
    t.integer  "street_name_id", null: false
    t.integer  "postal_code_id", null: false
  end

  create_table "state_codes", force: :cascade do |t|
    t.string   "state_code",      null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "country_code_id", null: false
  end

  create_table "street_names", force: :cascade do |t|
    t.string   "street_name",    null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "postal_code_id", null: false
  end

end
