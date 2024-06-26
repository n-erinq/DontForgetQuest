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

ActiveRecord::Schema[7.1].define(version: 2024_04_29_121722) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "awards", force: :cascade do |t|
    t.string "prize", null: false
    t.integer "required_checks", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "check_items", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "check_lists", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.integer "period", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "open", default: true
    t.index ["user_id"], name: "index_check_lists_on_user_id"
  end

  create_table "check_lists_items", force: :cascade do |t|
    t.bigint "check_list_id", null: false
    t.bigint "check_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["check_item_id"], name: "index_check_lists_items_on_check_item_id"
    t.index ["check_list_id"], name: "index_check_lists_items_on_check_list_id"
  end

  create_table "check_record_items", force: :cascade do |t|
    t.bigint "check_record_id", null: false
    t.bigint "check_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["check_item_id"], name: "index_check_record_items_on_check_item_id"
    t.index ["check_record_id"], name: "index_check_record_items_on_check_record_id"
  end

  create_table "check_records", force: :cascade do |t|
    t.bigint "check_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["check_list_id"], name: "index_check_records_on_check_list_id"
  end

  create_table "treasure_box_awards", force: :cascade do |t|
    t.bigint "treasure_box_id", null: false
    t.bigint "award_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["award_id"], name: "index_treasure_box_awards_on_award_id"
    t.index ["treasure_box_id"], name: "index_treasure_box_awards_on_treasure_box_id"
  end

  create_table "treasure_boxes", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "opened", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_treasure_boxes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "check_lists", "users"
  add_foreign_key "check_lists_items", "check_items"
  add_foreign_key "check_lists_items", "check_lists"
  add_foreign_key "check_record_items", "check_items"
  add_foreign_key "check_record_items", "check_records"
  add_foreign_key "check_records", "check_lists"
  add_foreign_key "treasure_box_awards", "awards"
  add_foreign_key "treasure_box_awards", "treasure_boxes"
  add_foreign_key "treasure_boxes", "users"
end
