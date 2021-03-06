ActiveRecord::Schema.define(version: 20190824090355) do

  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "body", null: false
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "correct", default: false
    t.integer "sort", default: 0
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["sort"], name: "index_answers_on_sort"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gists", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "question_id"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_gists_on_question_id"
    t.index ["user_id"], name: "index_gists_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "body", null: false
    t.integer "level", default: 0
    t.integer "test_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sort", default: 0
    t.index ["level"], name: "index_questions_on_level"
  end

  create_table "role_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.index ["role_id", "user_id"], name: "index_role_users_on_role_id_and_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string "name", null: false
    t.string "setting", null: false
    t.string "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setting"], name: "index_settings_on_setting", unique: true
  end

  create_table "test_authors", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "test_id", null: false
    t.index ["test_id", "user_id"], name: "index_test_authors_on_test_id_and_user_id"
  end

  create_table "test_passages", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "test_id", null: false
    t.boolean "evaluation", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "correct_questions", default: 0
    t.integer "current_question_id"
    t.index ["test_id", "user_id"], name: "index_test_passages_on_test_id_and_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "title", null: false
    t.integer "level", default: 0
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_tests_on_category_id"
    t.index ["level", "title"], name: "index_tests_on_level_and_title", unique: true
    t.index ["level"], name: "index_tests_on_level"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "type", default: "User", null: false
    t.boolean "email_contactable", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["type", "email_contactable"], name: "index_users_on_type_and_email_contactable"
    t.index ["type"], name: "index_users_on_type"
  end

  add_foreign_key "gists", "questions"
  add_foreign_key "gists", "users"
end
