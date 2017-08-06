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

ActiveRecord::Schema.define(version: 20170806213548) do

  create_table "addresses", force: :cascade do |t|
    t.string "model_type"
    t.integer "model_id"
    t.string "address_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.index ["model_type", "model_id"], name: "index_addresses_on_model_type_and_model_id"
  end

  create_table "daily_tokens", force: :cascade do |t|
    t.integer "user_id"
    t.integer "gym_id"
    t.string "token", default: "", null: false
    t.boolean "used", default: false, null: false
    t.date "date_used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gym_id"], name: "index_daily_tokens_on_gym_id"
    t.index ["token"], name: "index_daily_tokens_on_token", unique: true
    t.index ["user_id"], name: "index_daily_tokens_on_user_id"
  end

  create_table "gyms", force: :cascade do |t|
    t.string "name", null: false
    t.time "opening_time"
    t.time "closing_time"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved", default: false, null: false
    t.index ["name"], name: "index_gyms_on_name", unique: true
    t.index ["user_id"], name: "index_gyms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "gym_manager", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
