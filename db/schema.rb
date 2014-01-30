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

ActiveRecord::Schema.define(:version => 20131212122339) do

  create_table "actions", :force => true do |t|
    t.integer  "person_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "token_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cart_items", :force => true do |t|
    t.integer  "person_id"
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "qty"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "purchased_at"
    t.integer  "user_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_products", :force => true do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  create_table "clicks", :force => true do |t|
    t.integer "person_id"
    t.integer "count"
  end

  create_table "credit_cards", :force => true do |t|
    t.integer  "user_id"
    t.string   "cc_number"
    t.string   "cc_cvc"
    t.string   "cc_exp_year"
    t.string   "cc_exp_month"
    t.string   "cc_name"
    t.string   "cc_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "date"
    t.string   "comment"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gifts", :force => true do |t|
    t.integer  "person_id"
    t.integer  "product_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "users_id"
  end

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

  create_table "person_places", :id => false, :force => true do |t|
    t.integer "place_id"
    t.integer "person_id"
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "location"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "places", :force => true do |t|
    t.string "description"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "price"
  end

  create_table "stories", :force => true do |t|
    t.integer  "person_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "yard_places", :force => true do |t|
    t.integer "place_id"
    t.integer "yard_id"
  end

  create_table "yards", :force => true do |t|
    t.integer "lat"
    t.integer "lng"
    t.string  "name"
  end

end
