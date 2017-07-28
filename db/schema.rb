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

ActiveRecord::Schema.define(version: 20170728003659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorized_applications", force: :cascade do |t|
    t.string "api_key"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prompt_responses", force: :cascade do |t|
    t.bigint "prompt_session_id"
    t.boolean "bot_response"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prompt_session_id"], name: "index_prompt_responses_on_prompt_session_id"
  end

  create_table "prompt_sessions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "prompt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prompt_id"], name: "index_prompt_sessions_on_prompt_id"
    t.index ["user_id"], name: "index_prompt_sessions_on_user_id"
  end

  create_table "prompt_skips", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "prompt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prompt_id"], name: "index_prompt_skips_on_prompt_id"
    t.index ["user_id"], name: "index_prompt_skips_on_user_id"
  end

  create_table "prompts", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "prompt_responses", "prompt_sessions"
  add_foreign_key "prompt_sessions", "prompts"
  add_foreign_key "prompt_sessions", "users"
  add_foreign_key "prompt_skips", "prompts"
  add_foreign_key "prompt_skips", "users"
end
