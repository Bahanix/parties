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

ActiveRecord::Schema.define(:version => 20130511143254) do

  create_table "items", :force => true do |t|
    t.string   "name"
    t.integer  "party_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "items", ["party_id"], :name => "index_items_on_party_id"

  create_table "items_participants", :id => false, :force => true do |t|
    t.integer "item_id"
    t.integer "participant_id"
  end

  add_index "items_participants", ["item_id"], :name => "index_items_participants_on_item_id"
  add_index "items_participants", ["participant_id"], :name => "index_items_participants_on_participant_id"

  create_table "participants", :force => true do |t|
    t.string   "name"
    t.integer  "party_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "participants", ["party_id"], :name => "index_participants_on_party_id"

  create_table "parties", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.datetime "start_at"
    t.string   "slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
