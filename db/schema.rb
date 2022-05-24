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

ActiveRecord::Schema.define(version: 2022_05_24_201504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  add_foreign_key "pets", "users", column: "adopter_id"
end
