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

ActiveRecord::Schema.define(version: 2016_03_09_041732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "educations", id: :serial, force: :cascade do |t|
    t.string "school"
    t.string "image"
    t.text "description"
    t.string "school_url"
    t.string "degree"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_educations_on_profile_id"
  end

  create_table "experiences", id: :serial, force: :cascade do |t|
    t.string "job_title"
    t.text "description"
    t.string "company_url"
    t.string "image"
    t.date "from_date"
    t.date "to_date"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company_name"
    t.index ["profile_id"], name: "index_experiences_on_profile_id"
  end

  create_table "profiles", id: :serial, force: :cascade do |t|
    t.string "tagline"
    t.text "description"
    t.boolean "availability", default: false
    t.string "resume"
    t.string "photo"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "twitter_url"
    t.string "linkedin_url"
    t.string "github_url"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "projects", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "project_url"
    t.string "github_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.index ["profile_id"], name: "index_projects_on_profile_id"
  end

  create_table "skills", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_skills_on_category_id"
  end

  create_table "skillsets", id: :serial, force: :cascade do |t|
    t.integer "profile_id"
    t.integer "skill_id"
    t.integer "proficiency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_skillsets_on_profile_id"
    t.index ["skill_id"], name: "index_skillsets_on_skill_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "status", default: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "educations", "profiles"
  add_foreign_key "experiences", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "projects", "profiles"
  add_foreign_key "skills", "categories"
  add_foreign_key "skillsets", "profiles"
  add_foreign_key "skillsets", "skills"
end
