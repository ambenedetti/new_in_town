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

ActiveRecord::Schema.define(version: 2019_11_28_094459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "ignored_questions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_ignored_questions_on_question_id"
    t.index ["user_id"], name: "index_ignored_questions_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.bigint "category_id"
    t.string "city"
    t.bigint "user_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.index ["category_id"], name: "index_questions_on_category_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "reasons", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "tip_id"
    t.bigint "user_id"
    t.string "description"
    t.bigint "reason_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reason_id"], name: "index_reports_on_reason_id"
    t.index ["tip_id"], name: "index_reports_on_tip_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "tips", force: :cascade do |t|
    t.text "content"
    t.string "city"
    t.string "title"
    t.float "latitude"
    t.float "longitude"
    t.bigint "category_id"
    t.integer "status"
    t.bigint "user_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "upvote_count", default: 0
    t.string "country"
    t.index ["category_id"], name: "index_tips_on_category_id"
    t.index ["question_id"], name: "index_tips_on_question_id"
    t.index ["user_id"], name: "index_tips_on_user_id"
  end

  create_table "user_cities", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_user_cities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "unread_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer "direction"
    t.bigint "tip_id"
    t.integer "user_id"
    t.string "guest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tip_id"], name: "index_votes_on_tip_id"
  end

  add_foreign_key "ignored_questions", "questions"
  add_foreign_key "ignored_questions", "users"
  add_foreign_key "questions", "categories"
  add_foreign_key "questions", "users"
  add_foreign_key "reports", "reasons"
  add_foreign_key "reports", "tips"
  add_foreign_key "reports", "users"
  add_foreign_key "tips", "categories"
  add_foreign_key "tips", "questions"
  add_foreign_key "tips", "users"
  add_foreign_key "user_cities", "users"
  add_foreign_key "votes", "tips"
end
