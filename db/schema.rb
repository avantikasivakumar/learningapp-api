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

ActiveRecord::Schema[7.0].define(version: 2022_07_06_102318) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attempt_results", force: :cascade do |t|
    t.bigint "attempt_id", null: false
    t.bigint "question_id", null: false
    t.integer "chosenoption"
    t.boolean "result"
    t.integer "timetaken"
    t.boolean "attempted"
    t.boolean "markedforreview"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attempt_id"], name: "index_attempt_results_on_attempt_id"
    t.index ["question_id"], name: "index_attempt_results_on_question_id"
  end

  create_table "attempts", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_attempts_on_exercise_id"
    t.index ["user_id"], name: "index_attempts_on_user_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classns", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.bigint "board_id"
    t.bigint "subject_id"
    t.bigint "classn_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_courses_on_board_id"
    t.index ["classn_id"], name: "index_courses_on_classn_id"
    t.index ["subject_id"], name: "index_courses_on_subject_id"
  end

  create_table "courses_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_courses_users_on_course_id"
    t.index ["user_id"], name: "index_courses_users_on_user_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.bigint "topic_id", null: false
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_exercises_on_topic_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "file"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_materials_on_topic_id"
  end

  create_table "materialstats", force: :cascade do |t|
    t.bigint "material_id", null: false
    t.bigint "user_id", null: false
    t.boolean "vote"
    t.string "notes"
    t.boolean "status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_materialstats_on_material_id"
    t.index ["user_id"], name: "index_materialstats_on_user_id"
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.bigint "resource_owner_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.string "q"
    t.string "opt1"
    t.string "opt2"
    t.string "opt3"
    t.string "opt4"
    t.string "solution"
    t.integer "correctoption"
    t.bigint "exercise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_questions_on_exercise_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_topics_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.string "auth_token"
    t.string "name"
    t.string "mobile"
    t.date "dob"
    t.integer "otp"
    t.datetime "otp_generated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attempt_results", "attempts"
  add_foreign_key "attempt_results", "questions"
  add_foreign_key "attempts", "exercises"
  add_foreign_key "attempts", "users"
  add_foreign_key "courses", "boards"
  add_foreign_key "courses", "classns"
  add_foreign_key "courses", "subjects"
  add_foreign_key "courses_users", "courses"
  add_foreign_key "courses_users", "users"
  add_foreign_key "exercises", "topics"
  add_foreign_key "materials", "topics"
  add_foreign_key "materialstats", "materials"
  add_foreign_key "materialstats", "users"
  add_foreign_key "questions", "exercises"
  add_foreign_key "topics", "courses"
end
