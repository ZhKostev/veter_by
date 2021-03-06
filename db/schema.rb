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

ActiveRecord::Schema.define(:version => 20121204202922) do

  create_table "accounts", :force => true do |t|
    t.string   "email",               :default => "", :null => false
    t.string   "encrypted_password",  :default => "", :null => false
    t.datetime "remember_created_at"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "accounts", ["email"], :name => "index_accounts_on_email", :unique => true

  create_table "generator_states", :force => true do |t|
    t.integer  "wind_generator_id"
    t.float    "wind_speed"
    t.float    "power"
    t.boolean  "error",             :default => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "generator_states", ["wind_generator_id"], :name => "states_wind_generator_id_index"

  create_table "notifications", :force => true do |t|
    t.string   "email"
    t.string   "condition"
    t.float    "level"
    t.integer  "wind_generator_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "notifications", ["wind_generator_id"], :name => "n_wind_generator_id_index"

  create_table "regions", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "wind_generators", :force => true do |t|
    t.string   "title"
    t.float    "min_rated_power"
    t.float    "max_rated_power"
    t.float    "min_rated_wind_speed"
    t.float    "max_wind_speed"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "region_id"
    t.string   "photo"
  end

  add_index "wind_generators", ["region_id"], :name => "wg_region_id_index"

end
