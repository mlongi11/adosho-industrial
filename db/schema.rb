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

ActiveRecord::Schema.define(version: 2022_05_24_202154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breed_preferences", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "breed_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["breed_id"], name: "index_breed_preferences_on_breed_id"
    t.index ["user_id"], name: "index_breed_preferences_on_user_id"
  end

  create_table "breed_webs", force: :cascade do |t|
    t.bigint "primary_breed_id", null: false
    t.bigint "similar_breed_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["primary_breed_id"], name: "index_breed_webs_on_primary_breed_id"
    t.index ["similar_breed_id"], name: "index_breed_webs_on_similar_breed_id"
  end

  create_table "breeds", force: :cascade do |t|
    t.string "species"
    t.string "breed_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "interests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "interested_in_fostering_dogs"
    t.boolean "interested_in_fostering_cats"
    t.boolean "interested_in_adopting_dogs"
    t.boolean "interested_in_adopting_cats"
    t.integer "children_competability_preference"
    t.integer "dog_competability_preference"
    t.integer "cat_competability_preference"
    t.integer "activity_competability_preference"
    t.integer "home_alone_competability_preference"
    t.integer "human_sociability_competability_preference"
    t.string "enrichment_competability_preference"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_interests_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "pet_id", null: false
    t.bigint "user_id", null: false
    t.float "match_strength"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_id"], name: "index_matches_on_pet_id"
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "pet_breeds", force: :cascade do |t|
    t.bigint "breed_id", null: false
    t.bigint "pet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["breed_id"], name: "index_pet_breeds_on_breed_id"
    t.index ["pet_id"], name: "index_pet_breeds_on_pet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.date "estimated_birthday"
    t.string "status"
    t.bigint "adopter_id", null: false
    t.string "gender"
    t.float "weight"
    t.integer "children_competability_ranking"
    t.integer "dog_competability_ranking"
    t.integer "cat_competability_ranking"
    t.integer "home_alone_competability_ranking"
    t.integer "activity_competability_ranking"
    t.text "notes"
    t.string "species"
    t.string "picture"
    t.integer "human_socialability_competability_ranking"
    t.integer "enrichment_competability_ranking"
    t.string "adoption_center_identifier"
    t.integer "pictures_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["adopter_id"], name: "index_pets_on_adopter_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.bigint "pet_id", null: false
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_id"], name: "index_pictures_on_pet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "account_type"
    t.integer "watchlist_count"
    t.integer "match_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "watchlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_id"], name: "index_watchlists_on_pet_id"
    t.index ["user_id"], name: "index_watchlists_on_user_id"
  end

  add_foreign_key "breed_preferences", "breeds"
  add_foreign_key "breed_preferences", "users"
  add_foreign_key "breed_webs", "breeds", column: "primary_breed_id"
  add_foreign_key "breed_webs", "breeds", column: "similar_breed_id"
  add_foreign_key "interests", "users"
  add_foreign_key "matches", "pets"
  add_foreign_key "matches", "users"
  add_foreign_key "pet_breeds", "breeds"
  add_foreign_key "pet_breeds", "pets"
  add_foreign_key "pets", "users", column: "adopter_id"
  add_foreign_key "pictures", "pets"
  add_foreign_key "watchlists", "pets"
  add_foreign_key "watchlists", "users"
end
