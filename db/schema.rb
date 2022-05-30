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

ActiveRecord::Schema.define(version: 2022_05_23_125114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.string "avatar"
    t.integer "age"
    t.string "race"
    t.string "profession"
    t.integer "health"
    t.integer "mana"
    t.integer "strength"
    t.integer "stamina"
    t.integer "accuracy"
    t.integer "agility"
    t.integer "intelligence"
    t.integer "wisdom"
    t.integer "will"
    t.integer "charm"
    t.integer "money"
    t.bigint "inventory", array: true
    t.bigint "skills", array: true
    t.text "description"
    t.text "biography"
    t.bigint "game_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_characters_on_game_id"
    t.index ["name"], name: "index_characters_on_name", unique: true
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_games_on_name", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.string "type"
    t.text "description"
    t.bigint "game_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_items_on_game_id"
    t.index ["name"], name: "index_items_on_name", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "avatar"
    t.bigint "game_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_locations_on_game_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "location_id"
    t.bigint "character_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_posts_on_character_id"
    t.index ["location_id"], name: "index_posts_on_location_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", null: false
    t.string "type"
    t.text "description"
    t.bigint "game_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_skills_on_game_id"
    t.index ["name"], name: "index_skills_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "avatar"
    t.string "theme", default: "default"
    t.boolean "is_admin", default: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

end
