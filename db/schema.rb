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

ActiveRecord::Schema[7.0].define(version: 2022_12_08_045918) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drivers", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "number_plate", default: "", null: false
    t.string "token", default: "", null: false
    t.string "password_hash", default: "", null: false
    t.index ["token"], name: "index_on_drivers_token", unique: true
  end

  create_table "payment_sources", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.string "token_aceptation", null: false
    t.string "token_id", null: false
    t.index ["user_id"], name: "index_payment_sources_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "token", default: "", null: false
    t.string "password_hash", default: "", null: false
    t.index ["token"], name: "index_on_users_token", unique: true
  end

  add_foreign_key "payment_sources", "users"
end
