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

ActiveRecord::Schema[7.0].define(version: 2023_04_04_231711) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "descriptions", force: :cascade do |t|
    t.integer "result_id", null: false
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["result_id"], name: "index_descriptions_on_result_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "test_id", null: false
    t.string "title"
    t.integer "category_id", null: false
    t.integer "index"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_questions_on_category_id"
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "min_range"
    t.integer "max_range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_results_on_category_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "asignation_counter"
    t.integer "finish_counter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_questions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "question_id", null: false
    t.integer "evaluation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_user_questions_on_question_id"
    t.index ["user_id"], name: "index_user_questions_on_user_id"
  end

  create_table "user_tests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "test_id", null: false
    t.integer "evaluated_id"
    t.integer "status"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_user_tests_on_test_id"
    t.index ["user_id"], name: "index_user_tests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "middlename"
    t.string "lastname"
    t.string "email"
    t.integer "leader_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leader_id"], name: "index_users_on_leader_id"
  end

  add_foreign_key "descriptions", "results"
  add_foreign_key "questions", "categories"
  add_foreign_key "questions", "tests"
  add_foreign_key "results", "categories"
  add_foreign_key "user_questions", "questions"
  add_foreign_key "user_questions", "users"
  add_foreign_key "user_tests", "tests"
  add_foreign_key "user_tests", "users"
end
