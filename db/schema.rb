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

ActiveRecord::Schema.define(version: 20170722085136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_details", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "carRegistrationNumber"
    t.string   "manufacturer"
    t.string   "model"
    t.string   "color"
    t.string   "roadTaxNumber"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["user_id"], name: "index_car_details_on_user_id", using: :btree
  end

  create_table "parking_addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "address"
    t.string   "building"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "postcode"
    t.string   "additionalDetails"
    t.float    "monthlyRate"
    t.float    "weeklyRate"
    t.float    "dailyRate"
    t.float    "hourlyRate"
    t.float    "xCoordinates"
    t.float    "yCoordinate"
    t.boolean  "approval"
    t.string   "features"
    t.boolean  "status"
    t.datetime "availableFrom"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["user_id"], name: "index_parking_addresses_on_user_id", using: :btree
  end

  create_table "rental_orders", force: :cascade do |t|
    t.integer  "parking_address_id"
    t.integer  "user_id"
    t.datetime "rentStart"
    t.datetime "rentEnd"
    t.float    "orderTotal"
    t.boolean  "status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["parking_address_id"], name: "index_rental_orders_on_parking_address_id", using: :btree
    t.index ["user_id"], name: "index_rental_orders_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                    null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "gender"
    t.integer  "age"
    t.string   "identificationCardNumber"
    t.string   "phoneNumber"
    t.string   "companyName"
    t.string   "admin"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "car_details", "users"
  add_foreign_key "parking_addresses", "users"
  add_foreign_key "rental_orders", "parking_addresses"
  add_foreign_key "rental_orders", "users"
end
