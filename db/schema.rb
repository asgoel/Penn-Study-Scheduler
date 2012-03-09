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

ActiveRecord::Schema.define(:version => 20120308225840) do

# Could not dump table "courses" because of following StandardError
#   Unknown type 'registration' for column 'registrations'

  create_table "events", :force => true do |t|
    t.string    "name"
    t.integer   "course_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "events", ["course_id"], :name => "index_events_on_course_id"

  create_table "registrations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "registrations", ["course_id"], :name => "index_registrations_on_course_id"
  add_index "registrations", ["user_id"], :name => "index_registrations_on_user_id"

# Could not dump table "users" because of following StandardError
#   Unknown type 'registration' for column 'registrations'

end
