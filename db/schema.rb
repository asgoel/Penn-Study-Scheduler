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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120425102004) do

  create_table "courses", :force => true do |t|
    t.string    "department"
    t.integer   "number"
    t.string    "section"
    t.string    "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "user_id"
    t.text      "registrations"
  end

  create_table "events", :force => true do |t|
    t.string    "name"
    t.integer   "course_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "events", ["course_id"], :name => "index_events_on_course_id"

  create_table "invitations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "study_session_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "invitations", ["study_session_id"], :name => "index_invitations_on_study_session_id"
  add_index "invitations", ["user_id"], :name => "index_invitations_on_user_id"

  create_table "registrations", :force => true do |t|
    t.integer   "user_id"
    t.integer   "course_id"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  add_index "registrations", ["course_id"], :name => "index_registrations_on_course_id"
  add_index "registrations", ["user_id"], :name => "index_registrations_on_user_id"

  create_table "study_sessions", :force => true do |t|
    t.integer  "course_id"
    t.date     "date"
    t.time     "time"
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "study_sessions", ["course_id"], :name => "index_study_sessions_on_course_id"

  create_table "uploads", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "schedule_file_name"
    t.string   "schedule_content_type"
    t.integer  "schedule_file_size"
    t.datetime "schedule_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "email",                  :default => "", :null => false
    t.string    "encrypted_password",     :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.string    "confirmation_token"
    t.timestamp "confirmed_at"
    t.timestamp "confirmation_sent_at"
    t.string    "unconfirmed_email"
    t.timestamp "created_at",                             :null => false
    t.timestamp "updated_at",                             :null => false
    t.string    "first_name"
    t.string    "last_name"
    t.text      "registrations"
    t.boolean   "admin"
    t.string    "schedule_file_name"
    t.string    "schedule_content_type"
    t.integer   "schedule_file_size"
    t.datetime  "schedule_updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
