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

ActiveRecord::Schema.define(version: 20181026083104) do

  create_table "avator_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "avator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avator_id"], name: "index_avator_users_on_avator_id"
    t.index ["user_id"], name: "index_avator_users_on_user_id"
  end

  create_table "avators", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "image"
    t.integer "submit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "submit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["submit_id"], name: "index_likes_on_submit_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submits", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "kind"
    t.string "tag"
    t.string "impression"
    t.integer "money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "tags", force: :cascade do |t|
    t.integer "submit_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "avator_id"
    t.text "selfinfo"
    t.string "uid"
    t.string "provider"
    t.string "nickname"
    t.string "location"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
