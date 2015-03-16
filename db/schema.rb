# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150316184400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer "visiting_team"
    t.integer "home_team"
    t.integer "visiting_score"
    t.integer "home_score"
    t.integer "winner"
    t.integer "team_id"
    t.integer "player_id"
    t.integer "league_id"
  end

  create_table "league", force: :cascade do |t|
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.integer  "rating"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.boolean  "free_agent"
    t.integer  "league_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "league_id"
  end

end
