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

ActiveRecord::Schema.define(:version => 20120713081858) do

  create_table "abouts", :force => true do |t|
    t.integer  "post_id"
    t.integer  "page_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "abouts", ["page_id"], :name => "index_abouts_on_page_id"
  add_index "abouts", ["post_id"], :name => "index_abouts_on_post_id"

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "user_id"
    t.integer  "page_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "articles", ["page_id"], :name => "index_articles_on_page_id"
  add_index "articles", ["user_id"], :name => "index_articles_on_user_id"

  create_table "billboards", :force => true do |t|
    t.string   "header"
    t.text     "content"
    t.string   "button_name"
    t.string   "button_value"
    t.integer  "page_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "town"
    t.string   "admin"
    t.string   "country"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "text"
    t.integer  "user_id"
    t.integer  "likes_count",      :default => 0
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "follows", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "user_id"
    t.integer  "pair_id"
    t.boolean  "friend",      :default => false
    t.boolean  "special",     :default => false
    t.boolean  "read",        :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "follows", ["follower_id"], :name => "index_follows_on_follower_id"
  add_index "follows", ["user_id"], :name => "index_follows_on_user_id"

  create_table "likes", :force => true do |t|
    t.integer  "likable_id"
    t.string   "likable_type"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "likes", ["likable_id"], :name => "index_likes_on_likable_id"
  add_index "likes", ["user_id"], :name => "index_likes_on_user_id"

  create_table "mentions", :force => true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "mentions", ["post_id"], :name => "index_mentions_on_post_id"
  add_index "mentions", ["user_id"], :name => "index_mentions_on_user_id"

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "from_id"
    t.string   "title"
    t.text     "body"
    t.boolean  "read"
    t.boolean  "flaged"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "messages", ["from_id"], :name => "index_messages_on_from_id"
  add_index "messages", ["user_id"], :name => "index_messages_on_user_id"

  create_table "notifications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "notifier_id"
    t.string   "notifier_type"
    t.boolean  "read",          :default => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "notifications", ["notifier_id"], :name => "index_notifications_on_notifier_id"
  add_index "notifications", ["user_id"], :name => "index_notifications_on_user_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "intro"
    t.integer  "creator_id"
    t.string   "creator_type"
    t.boolean  "editable"
    t.boolean  "has_billboard"
    t.boolean  "has_whiteboard"
    t.boolean  "has_posters"
    t.boolean  "has_image"
    t.boolean  "has_properties"
    t.string   "image"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "pages", ["creator_id"], :name => "index_pages_on_creator_id"

  create_table "posters", :force => true do |t|
    t.integer  "page_id"
    t.string   "background"
    t.string   "caption"
    t.text     "text"
    t.string   "link"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posters", ["page_id"], :name => "index_posters_on_page_id"

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.text     "text"
    t.integer  "parent_id"
    t.integer  "children_count", :default => 0
    t.integer  "likes_count",    :default => 0
    t.integer  "comments_count", :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "posts", ["parent_id"], :name => "index_posts_on_parent_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "profiles", :force => true do |t|
    t.boolean  "sex"
    t.date     "date_of_birth"
    t.string   "hometown"
    t.string   "current_city"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "properties", :force => true do |t|
    t.integer  "page_id"
    t.string   "label"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "properties", ["page_id"], :name => "index_properties_on_page_id"

  create_table "updates", :force => true do |t|
    t.integer  "page_id"
    t.integer  "updater_id"
    t.string   "updater_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "updates", ["page_id"], :name => "index_updates_on_page_id"
  add_index "updates", ["updater_id"], :name => "index_updates_on_updater_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "username"
    t.string   "name"
    t.string   "avatar"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "whiteboards", :force => true do |t|
    t.integer  "page_id"
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "whiteboards", ["page_id"], :name => "index_whiteboards_on_page_id"

end
