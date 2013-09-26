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

ActiveRecord::Schema.define(:version => 20130925095952) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "token_secret"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "cards", :force => true do |t|
    t.integer  "user_id"
    t.string   "cc_type"
    t.string   "cc_number"
    t.string   "cc_cvc"
    t.string   "cc_exp_month"
    t.string   "cc_exp_year"
    t.string   "cc_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "cards", ["user_id"], :name => "index_cards_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clicks", :force => true do |t|
    t.integer "person_id"
    t.integer "count"
  end

  add_index "clicks", ["person_id"], :name => "index_clicks_on_user_id_and_person_id"

  create_table "credit_cards", :force => true do |t|
    t.integer  "user_id"
    t.string   "cc_number"
    t.string   "cc_cvc"
    t.string   "cc_exp_year"
    t.string   "cc_exp_month"
    t.string   "cc_name"
    t.string   "cc_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "credit_cards", ["user_id"], :name => "index_credit_cards_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "date"
    t.string   "comment"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gifts", :force => true do |t|
    t.integer  "person_id"
    t.integer  "product_id"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "histories", :force => true do |t|
    t.integer  "user_id"
    t.integer  "person_id"
    t.datetime "when"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "histories", ["user_id"], :name => "index_histories_on_user_id"

  create_table "people", :force => true do |t|
    t.string   "name",       :limit => 50
    t.string   "surname",    :limit => 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people_users", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "user_id"
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "location"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "person_id"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "stories", :force => true do |t|
    t.integer  "person_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "stories", ["person_id"], :name => "index_stories_on_person_id"

  create_table "update_actions", :force => true do |t|
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "comment"
  end

  create_table "users", :force => true do |t|
    t.string   "username",               :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
