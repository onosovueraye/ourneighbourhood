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

ActiveRecord::Schema[7.0].define(version: 2023_06_06_113440) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "report_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_comments_on_report_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "report_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_follows_on_report_id"
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "description"
    t.bigint "ticket_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_notes_on_ticket_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "location"
    t.string "category"
    t.string "votes"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "report_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_tickets_on_report_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "neighbourhood"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "reports"
  add_foreign_key "comments", "users"
  add_foreign_key "follows", "reports"
  add_foreign_key "follows", "users"
  add_foreign_key "notes", "tickets"
  add_foreign_key "reports", "users"
  add_foreign_key "tickets", "reports"
  add_foreign_key "tickets", "users"
end
