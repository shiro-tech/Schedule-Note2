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

ActiveRecord::Schema.define(version: 2021_06_05_115458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calenders", force: :cascade do |t|
    t.string "datetime"
    t.string "work_name"
    t.string "worker"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "new"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progress_comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "progress_id"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progresses", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "file"
    t.string "article"
    t.string "other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "workperiod"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topic_comments", force: :cascade do |t|
    t.string "user_id"
    t.string "topic_id"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "file"
    t.string "article"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "company"
    t.string "cellphone"
    t.string "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end