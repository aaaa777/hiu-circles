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

ActiveRecord::Schema[7.1].define(version: 2024_10_03_014317) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "circle_log_types", force: :cascade do |t|
    t.string "name"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "circle_logs", force: :cascade do |t|
    t.bigint "circle_id", null: false
    t.bigint "author_id", null: false
    t.bigint "target_member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_circle_logs_on_author_id"
    t.index ["circle_id"], name: "index_circle_logs_on_circle_id"
    t.index ["target_member_id"], name: "index_circle_logs_on_target_member_id"
  end

  create_table "circle_roles", force: :cascade do |t|
    t.string "name"
    t.bigint "circle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_circle_roles_on_circle_id"
  end

  create_table "circles", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "document_excel_inputs", force: :cascade do |t|
    t.integer "col_index"
    t.integer "row_index"
    t.string "value"
    t.bigint "document_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_document_excel_inputs_on_document_id"
  end

  create_table "document_types", force: :cascade do |t|
    t.string "name"
    t.binary "template_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.binary "file"
    t.bigint "circle_id", null: false
    t.bigint "document_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_documents_on_circle_id"
    t.index ["document_type_id"], name: "index_documents_on_document_type_id"
  end

  create_table "enabled_request_types", force: :cascade do |t|
    t.bigint "circle_id", null: false
    t.bigint "request_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_enabled_request_types_on_circle_id"
    t.index ["request_type_id"], name: "index_enabled_request_types_on_request_type_id"
  end

  create_table "member_circle_role_relations", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "circle_role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_role_id"], name: "index_member_circle_role_relations_on_circle_role_id"
    t.index ["member_id"], name: "index_member_circle_role_relations_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "status"
    t.bigint "circle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_members_on_circle_id"
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.string "caption"
    t.string "content"
    t.string "link"
    t.boolean "is_external"
    t.string "visibility"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "request_types", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "flow_name"
    t.bigint "circle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_request_types_on_circle_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "status"
    t.string "note"
    t.bigint "circle_id", null: false
    t.bigint "request_type_id", null: false
    t.bigint "applicant_id"
    t.bigint "approver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_requests_on_applicant_id"
    t.index ["approver_id"], name: "index_requests_on_approver_id"
    t.index ["circle_id"], name: "index_requests_on_circle_id"
    t.index ["request_type_id"], name: "index_requests_on_request_type_id"
  end

  create_table "shortened_urls", id: :serial, force: :cascade do |t|
    t.integer "owner_id"
    t.string "owner_type", limit: 20
    t.text "url", null: false
    t.string "unique_key", limit: 10, null: false
    t.string "category"
    t.integer "use_count", default: 0, null: false
    t.datetime "expires_at", precision: nil
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["category"], name: "index_shortened_urls_on_category"
    t.index ["owner_id", "owner_type"], name: "index_shortened_urls_on_owner_id_and_owner_type"
    t.index ["unique_key"], name: "index_shortened_urls_on_unique_key", unique: true
    t.index ["url"], name: "index_shortened_urls_on_url"
  end

  create_table "site_roles", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_site_role_relations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "site_role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_role_id"], name: "index_user_site_role_relations_on_site_role_id"
    t.index ["user_id"], name: "index_user_site_role_relations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
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
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "student_number", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "circle_logs", "circles"
  add_foreign_key "circle_logs", "members", column: "author_id"
  add_foreign_key "circle_logs", "members", column: "target_member_id"
  add_foreign_key "circle_roles", "circles"
  add_foreign_key "document_excel_inputs", "documents"
  add_foreign_key "documents", "circles"
  add_foreign_key "documents", "document_types"
  add_foreign_key "enabled_request_types", "circles"
  add_foreign_key "enabled_request_types", "request_types"
  add_foreign_key "member_circle_role_relations", "circle_roles"
  add_foreign_key "member_circle_role_relations", "members"
  add_foreign_key "members", "circles"
  add_foreign_key "request_types", "circles"
  add_foreign_key "requests", "circles"
  add_foreign_key "requests", "request_types"
  add_foreign_key "requests", "users", column: "applicant_id"
  add_foreign_key "requests", "users", column: "approver_id"
  add_foreign_key "user_site_role_relations", "site_roles"
  add_foreign_key "user_site_role_relations", "users"
end
