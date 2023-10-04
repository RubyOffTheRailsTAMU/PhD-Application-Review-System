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

ActiveRecord::Schema[7.0].define(version: 2023_10_04_064719) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicantions", force: :cascade do |t|
    t.integer "application_cas_id"
    t.string "application_name"
    t.string "application_gender"
    t.string "application_citizenship_country"
    t.string "application_dob"
    t.string "application_email"
    t.string "application_degree"
    t.datetime "application_submitted"
    t.string "application_status"
    t.string "application_research"
    t.string "application_faculty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applicants", force: :cascade do |t|
    t.string "application_cas_id"
    t.string "application_name"
    t.string "application_gender"
    t.string "application_citizenship_country"
    t.datetime "application_dob"
    t.string "application_email"
    t.string "application_degree"
    t.string "application_submitted"
    t.string "application_status"
    t.string "application_research"
    t.string "application_faculty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gres", force: :cascade do |t|
    t.bigint "applicant_id", null: false
    t.integer "quantitative_scaled"
    t.integer "quantitative_percentile"
    t.integer "verbal_scaled"
    t.integer "verbal_percentile"
    t.float "analytical_scaled"
    t.integer "analytical_percentile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_gres_on_applicant_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "review_id"
    t.string "user_netid"
    t.string "candidate_id"
    t.string "review_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "toefls", force: :cascade do |t|
    t.bigint "applicant_id", null: false
    t.integer "listening"
    t.integer "reading"
    t.integer "result"
    t.integer "speaking"
    t.integer "writing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_toefls_on_applicant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_netid"
    t.string "user_name"
    t.integer "user_level"
  end

  add_foreign_key "gres", "applicants", on_delete: :cascade
  add_foreign_key "toefls", "applicants", on_delete: :cascade
end
