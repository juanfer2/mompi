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

ActiveRecord::Schema[7.0].define(version: 2022_12_12_042337) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "driver_status", ["available", "occupied"]
  create_enum "payment_sources_kind", ["card", "nequi"]
  create_enum "payment_status", ["pending", "success", "failed"]
  create_enum "ride_status", ["active", "finished"]

  create_table "drivers", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "number_plate", default: "", null: false
    t.string "token", default: "", null: false
    t.string "password_hash", default: "", null: false
    t.boolean "available", default: true, null: false
    t.enum "status", default: "available", null: false, enum_type: "driver_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_on_drivers_token", unique: true
  end

  create_table "payment_sources", force: :cascade do |t|
    t.bigint "rider_id", null: false
    t.string "name", null: false
    t.string "token_aceptation", null: false
    t.string "token_id", null: false
    t.string "resource_id", null: false
    t.enum "kind", null: false, enum_type: "payment_sources_kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rider_id"], name: "index_payment_sources_on_rider_id"
  end

  create_table "ride_payments", force: :cascade do |t|
    t.bigint "ride_id", null: false
    t.enum "status", null: false, enum_type: "payment_status"
    t.string "resource_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ride_id"], name: "index_ride_payments_on_ride_id"
  end

  create_table "riders", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "token", default: "", null: false
    t.string "password_hash", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_on_riders_token", unique: true
  end

  create_table "rides", force: :cascade do |t|
    t.bigint "rider_id", null: false
    t.bigint "driver_id"
    t.enum "status", null: false, enum_type: "ride_status"
    t.enum "payment_status", enum_type: "payment_status"
    t.decimal "start_location_latitude", precision: 17, scale: 14, null: false
    t.decimal "start_location_longitude", precision: 17, scale: 14, null: false
    t.decimal "end_location_latitude", precision: 17, scale: 14
    t.decimal "end_location_longitude", precision: 17, scale: 14
    t.datetime "start_at"
    t.datetime "end_at"
    t.decimal "kilometers", precision: 12, scale: 2
    t.string "currency"
    t.decimal "total_price_kilometer", precision: 12, scale: 2
    t.decimal "total_price_time", precision: 12, scale: 2
    t.decimal "base_fee", precision: 12, scale: 2
    t.decimal "total", precision: 12, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_rides_on_driver_id"
    t.index ["rider_id"], name: "index_rides_on_rider_id"
  end

  add_foreign_key "payment_sources", "riders"
  add_foreign_key "ride_payments", "rides"
  add_foreign_key "rides", "drivers"
  add_foreign_key "rides", "riders"
end
