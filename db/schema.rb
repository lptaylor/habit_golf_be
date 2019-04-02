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

ActiveRecord::Schema.define(version: 2019_04_02_203509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_clubs", force: :cascade do |t|
    t.bigint "club_id"
    t.bigint "player_id"
    t.index ["club_id"], name: "index_player_clubs_on_club_id"
    t.index ["player_id"], name: "index_player_clubs_on_player_id"
  end

  create_table "player_stats", force: :cascade do |t|
    t.float "hook_percentage"
    t.float "pull_percentage"
    t.float "great_shot_percentage"
    t.float "push_percentage"
    t.float "slice_percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "player_id"
    t.index ["player_id"], name: "index_player_stats_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shots", force: :cascade do |t|
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "club_id"
    t.index ["club_id"], name: "index_shots_on_club_id"
  end

  add_foreign_key "player_clubs", "clubs"
  add_foreign_key "player_clubs", "players"
  add_foreign_key "player_stats", "players"
  add_foreign_key "shots", "clubs"
end