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

ActiveRecord::Schema[7.0].define(version: 2022_05_31_152948) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.string "avatar"
    t.integer "age"
    t.string "race"
    t.string "profession"
    t.integer "health"
    t.integer "max_health"
    t.integer "energy"
    t.integer "max_energy"
    t.integer "strength", default: 0
    t.integer "stamina", default: 0
    t.integer "accuracy", default: 0
    t.integer "agility", default: 0
    t.integer "intelligence", default: 0
    t.integer "wisdom", default: 0
    t.integer "will", default: 0
    t.integer "charm", default: 0
    t.integer "money", default: 0
    t.bigint "items", array: true
    t.bigint "skills", array: true
    t.text "description"
    t.text "biography"
    t.bigint "game_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_characters_on_game_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name", null: false
    t.string "avatar"
    t.text "description"
    t.boolean "nsfw", default: false
    t.boolean "whitelisted", default: false
    t.bigint "admins", array: true
    t.bigint "whitelist", array: true
    t.bigint "blacklist", array: true
    t.integer "max_health"
    t.integer "max_energy"
    t.integer "max_stat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_games_on_name", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.string "kind"
    t.text "description"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_items_on_game_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "avatar"
    t.bigint "parent_location_id"
    t.bigint "child_locations_ids", default: [], array: true
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_locations_on_game_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "location_to"
    t.bigint "location_id"
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_posts_on_character_id"
    t.index ["location_id"], name: "index_posts_on_location_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", null: false
    t.string "kind"
    t.text "description"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_skills_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "avatar"
    t.string "theme", default: "flatly"
    t.boolean "is_admin", default: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

end
