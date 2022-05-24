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

ActiveRecord::Schema.define(version: 2022_05_19_181142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breed_preferences", force: :cascade do |t|
    t.integer "user_id"
    t.integer "breed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "breed_webs", force: :cascade do |t|
    t.integer "primary_breed_id"
    t.integer "similar_breed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "interests", force: :cascade do |t|
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
    t.integer "enrichment_competability_preference"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "list_of_breeds", force: :cascade do |t|
    t.string "breed_name"
    t.string "species"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "pet_id"
    t.integer "user_id"
    t.decimal "match_strength"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pet_breeds", force: :cascade do |t|
    t.integer "breed_id"
    t.integer "pet_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.date "estimated_birthday"
    t.string "status"
    t.integer "adopter_id"
    t.string "gender"
    t.decimal "weight"
    t.text "notes"
    t.string "adoption_center_identifier"
    t.integer "children_competability_ranking"
    t.integer "dog_competability_ranking"
    t.integer "cat_competability_ranking"
    t.integer "home_alone_competability_ranking"
    t.integer "activity_competability_ranking"
    t.integer "human_socialability_competability_ranking"
    t.string "enrichment_competability_ranking"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.integer "pet_id"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.integer "user_id"
    t.integer "pet_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
