# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141118141214) do

  create_table "acceptable_students", force: true do |t|
    t.string   "studentId"
    t.integer  "addedBy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acceptable_users", force: true do |t|
    t.string   "user_id"
    t.integer  "added_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "approvals", force: true do |t|
    t.integer  "user_id"
    t.string   "file_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bulletins", force: true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.integer  "invited_by_id"
    t.integer  "message_id"
    t.boolean  "approval_pending", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["message_id"], name: "index_comments_on_message_id"

  create_table "completion_statuses", force: true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", force: true do |t|
    t.string   "name"
    t.integer  "filetype"
    t.string   "file_extension"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "file_types", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer  "author_id"
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publish_requests", force: true do |t|
    t.boolean  "public"
    t.integer  "file_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "completion_status_id"
    t.integer  "max_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "files_file_name"
    t.string   "files_content_type"
    t.integer  "files_file_size"
    t.datetime "files_updated_at"
    t.string   "files1_file_name"
    t.string   "files1_content_type"
    t.integer  "files1_file_size"
    t.datetime "files1_updated_at"
    t.string   "files2_file_name"
    t.string   "files2_content_type"
    t.integer  "files2_file_size"
    t.datetime "files2_updated_at"
    t.string   "files3_file_name"
    t.string   "files3_content_type"
    t.integer  "files3_file_size"
    t.datetime "files3_updated_at"
    t.string   "files4_file_name"
    t.string   "files4_content_type"
    t.integer  "files4_file_size"
    t.datetime "files4_updated_at"
    t.string   "files5_file_name"
    t.string   "files5_content_type"
    t.integer  "files5_file_size"
    t.datetime "files5_updated_at"
    t.string   "files6_file_name"
    t.string   "files6_content_type"
    t.integer  "files6_file_size"
    t.datetime "files6_updated_at"
    t.string   "files7_file_name"
    t.string   "files7_content_type"
    t.integer  "files7_file_size"
    t.datetime "files7_updated_at"
    t.string   "files8_file_name"
    t.string   "files8_content_type"
    t.integer  "files8_file_size"
    t.datetime "files8_updated_at"
    t.string   "files9_file_name"
    t.string   "files9_content_type"
    t.integer  "files9_file_size"
    t.datetime "files9_updated_at"
    t.string   "fileTitle"
    t.string   "file2Title"
    t.string   "file3Title"
    t.string   "file4Title"
    t.string   "file5Title"
    t.string   "file6Title"
    t.string   "file7Title"
    t.string   "file8Title"
    t.string   "file9Title"
    t.string   "file_description"
    t.string   "file1_description"
    t.string   "file2_description"
    t.string   "file3_description"
    t.string   "file4_description"
    t.string   "file5_description"
    t.string   "file6_description"
    t.string   "file7_description"
    t.string   "file8_description"
    t.string   "file9_description"
    t.string   "file1Title"
  end

  create_table "user_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "pawprint"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "github_username"
    t.string   "semester"
    t.string   "phone"
    t.string   "resume_url"
    t.text     "about_me"
    t.string   "linkedin_url"
    t.integer  "user_type_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                       default: "", null: false
    t.string   "encrypted_password",          default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "profilepicture_file_name"
    t.string   "profilepicture_content_type"
    t.integer  "profilepicture_file_size"
    t.datetime "profilepicture_updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
