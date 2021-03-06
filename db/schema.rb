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

ActiveRecord::Schema.define(version: 20171014233539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.datetime "last_seen"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_clients_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
  end

  create_table "conversations", force: :cascade do |t|
    t.boolean "open"
    t.boolean "notification"
    t.bigint "client_id"
    t.index ["client_id"], name: "index_conversations_on_client_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "extension"
    t.bigint "task_id"
    t.bigint "client_id"
    t.index ["client_id"], name: "index_documents_on_client_id"
    t.index ["task_id"], name: "index_documents_on_task_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.boolean "seen", default: false
    t.bigint "client_id"
    t.bigint "user_id"
    t.index ["client_id"], name: "index_messages_on_client_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "action"
    t.text "body"
    t.date "due_date"
    t.string "status"
    t.bigint "client_id"
    t.index ["client_id"], name: "index_tasks_on_client_id"
  end

  create_table "user_conversations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "conversation_id"
    t.index ["conversation_id"], name: "index_user_conversations_on_conversation_id"
    t.index ["user_id"], name: "index_user_conversations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.string "password_digest"
    t.string "password"
    t.string "password_confirmation"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
  end

end
