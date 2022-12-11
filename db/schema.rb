# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_11_123954) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "payment_sources_kind", ["card", "nequi"]
  create_enum "ride_status", ["pending", "active", "finished", "canceled"]

  create_table "drivers", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "number_plate", default: "", null: false
    t.string "token", default: "", null: false
    t.string "password_hash", default: "", null: false
    t.index ["token"], name: "index_on_drivers_token", unique: true
  end

  create_table "payment_sources", force: :cascade do |t|
    t.bigint "rider_id", null: false
    t.string "name", null: false
    t.string "token_aceptation", null: false
    t.string "token_id", null: false
    t.string "resource_id", null: false
    t.enum "kind", null: false, enum_type: "payment_sources_kind"
    t.index ["rider_id"], name: "index_payment_sources_on_rider_id"
  end

  create_table "riders", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "token", default: "", null: false
    t.string "password_hash", default: "", null: false
    t.index ["token"], name: "index_on_riders_token", unique: true
  end

  create_table "rides", force: :cascade do |t|
    t.bigint "rider_id", null: false
    t.bigint "driver_id"
    t.enum "ride_status", default: "pending", null: false, enum_type: "ride_status"
    t.float "start_latitude", null: false
    t.float "start_longitude", null: false
    t.float "end_latitude", null: false
    t.float "end_longitude", null: false
    t.decimal "base_feed", null: false
    t.decimal "total", null: false
    t.index ["driver_id"], name: "index_rides_on_driver_id"
    t.index ["rider_id"], name: "index_rides_on_rider_id"
  end

  add_foreign_key "payment_sources", "riders"
  add_foreign_key "rides", "drivers"
  add_foreign_key "rides", "riders"
end
