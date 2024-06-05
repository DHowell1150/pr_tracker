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

ActiveRecord::Schema[7.1].define(version: 2024_05_21_215512) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "athletes", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.date "birthday"
    t.integer "feet"
    t.integer "inches"
    t.integer "weight"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_athletes_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.bigint "athlete_id", null: false
    t.bigint "movement_id", null: false
    t.float "target_weight"
    t.integer "target_reps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_goals_on_athlete_id"
    t.index ["movement_id"], name: "index_goals_on_movement_id"
  end

  create_table "movements", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image"
    t.string "video"
    t.bigint "athlete_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_movements_on_athlete_id"
  end

  create_table "progress_movements", force: :cascade do |t|
    t.bigint "progress_id", null: false
    t.bigint "movement_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movement_id"], name: "index_progress_movements_on_movement_id"
    t.index ["progress_id"], name: "index_progress_movements_on_progress_id"
  end

  create_table "progresses", force: :cascade do |t|
    t.date "date"
    t.integer "reps"
    t.integer "weight"
    t.bigint "athlete_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_progresses_on_athlete_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "athletes", "users"
  add_foreign_key "goals", "athletes"
  add_foreign_key "goals", "movements"
  add_foreign_key "movements", "athletes"
  add_foreign_key "progress_movements", "movements"
  add_foreign_key "progress_movements", "progresses"
  add_foreign_key "progresses", "athletes"
end
