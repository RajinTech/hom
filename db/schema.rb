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

ActiveRecord::Schema.define(version: 2019_02_09_200021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string "building_style", null: false
    t.integer "parking_spaces", null: false
    t.boolean "pets"
    t.string "zoning"
    t.string "school_district"
    t.string "heating"
    t.string "cooling"
    t.boolean "hud"
    t.boolean "smoking"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "listing_id"
    t.index ["listing_id"], name: "index_amenities_on_listing_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "bedrooms", default: "", null: false
    t.string "bathrooms", default: "", null: false
    t.string "rent", default: "", null: false
    t.string "date_available", default: "", null: false
    t.string "lease_length", default: "", null: false
    t.integer "sq_ft"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "listing_id"
    t.index ["listing_id"], name: "index_features_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "street", null: false
    t.string "unit", default: "", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip", null: false
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "image"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_pictures_on_listing_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "role", default: "tenant", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
