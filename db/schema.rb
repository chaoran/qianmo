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

ActiveRecord::Schema.define(:version => 20120919204518) do

  create_table "abouts", :force => true do |t|
    t.integer  "post_id"
    t.integer  "page_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "abouts", ["page_id"], :name => "index_abouts_on_page_id"
  add_index "abouts", ["post_id"], :name => "index_abouts_on_post_id"

  create_table "accounts", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "username"
    t.datetime "remembered_at"
    t.datetime "confirmed_at"
    t.datetime "password_set_at"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "accounts", ["email"], :name => "index_accounts_on_email", :unique => true
  add_index "accounts", ["password_reset_token"], :name => "index_accounts_on_password_reset_token", :unique => true
  add_index "accounts", ["username"], :name => "index_accounts_on_username", :unique => true

  create_table "albums", :force => true do |t|
    t.integer  "page_id"
    t.string   "title"
    t.string   "cover"
    t.string   "artist"
    t.string   "edition"
    t.string   "genre"
    t.string   "studio"
    t.string   "country"
    t.date     "released_on"
    t.text     "tracks"
    t.text     "introduction"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "albums", ["page_id"], :name => "index_albums_on_page_id"

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "published"
    t.integer  "user_id"
    t.integer  "page_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "description"
  end

  add_index "articles", ["page_id"], :name => "index_articles_on_page_id"
  add_index "articles", ["title", "page_id"], :name => "index_articles_on_title_and_page_id"
  add_index "articles", ["title", "user_id"], :name => "index_articles_on_title_and_user_id"
  add_index "articles", ["user_id"], :name => "index_articles_on_user_id"

  create_table "books", :force => true do |t|
    t.integer  "page_id"
    t.string   "title"
    t.string   "alt_title"
    t.string   "subtitle"
    t.string   "author"
    t.string   "cover"
    t.string   "translator"
    t.string   "publisher"
    t.string   "pages"
    t.string   "binding"
    t.string   "isbn"
    t.string   "genre"
    t.string   "country"
    t.date     "released_on"
    t.text     "summary"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "books", ["page_id"], :name => "index_books_on_page_id"

  create_table "confirmations", :force => true do |t|
    t.string   "unconfirmed_email"
    t.string   "confirmation_token"
    t.datetime "confirmation_sent_at"
    t.integer  "account_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "confirmations", ["account_id"], :name => "index_confirmations_on_account_id", :unique => true
  add_index "confirmations", ["confirmation_token"], :name => "index_confirmations_on_confirmation_token", :unique => true

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

  create_table "galleries", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "page_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "galleries", ["page_id"], :name => "index_galleries_on_page_id"
  add_index "galleries", ["title", "page_id"], :name => "index_galleries_on_title_and_page_id"
  add_index "galleries", ["title", "user_id"], :name => "index_galleries_on_title_and_user_id"
  add_index "galleries", ["user_id"], :name => "index_galleries_on_user_id"

  create_table "likes", :force => true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "likes", ["post_id"], :name => "index_likes_on_post_id"
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

  create_table "movies", :force => true do |t|
    t.integer  "page_id"
    t.string   "title"
    t.string   "image"
    t.string   "directed_by"
    t.string   "written_by"
    t.string   "starring"
    t.string   "genre"
    t.string   "studio"
    t.string   "country"
    t.string   "also_known_as"
    t.date     "released_on"
    t.text     "storyline"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "movies", ["page_id"], :name => "index_movies_on_page_id"

  create_table "news", :force => true do |t|
    t.integer  "page_id"
    t.string   "title"
    t.string   "url"
    t.text     "summary"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "news", ["page_id"], :name => "index_news_on_page_id"

  create_table "notifications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "notifier_id"
    t.string   "notifier_type"
    t.boolean  "read",          :default => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "notifications", ["notifier_id", "notifier_type"], :name => "index_notifications_on_notifier_id_and_notifier_type"
  add_index "notifications", ["user_id"], :name => "index_notifications_on_user_id"

  create_table "page_follows", :force => true do |t|
    t.integer  "page_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "page_follows", ["page_id"], :name => "index_page_follows_on_page_id"
  add_index "page_follows", ["user_id"], :name => "index_page_follows_on_user_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "intro"
    t.string   "category"
    t.integer  "user_id"
    t.boolean  "editable"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pages", ["title"], :name => "index_pages_on_title"
  add_index "pages", ["user_id"], :name => "index_pages_on_user_id"

  create_table "pictures", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "description"
    t.string   "mentions"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "pictures", ["gallery_id"], :name => "index_pictures_on_gallery_id"

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.text     "text"
    t.integer  "entity_id"
    t.string   "entity_type"
    t.integer  "parent_id"
    t.integer  "ancestor_id"
    t.integer  "reposts_count",  :default => 0
    t.integer  "likes_count",    :default => 0
    t.integer  "comments_count", :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "posts", ["ancestor_id"], :name => "index_posts_on_ancestor_id"
  add_index "posts", ["entity_id", "entity_type"], :name => "index_posts_on_entity_id_and_entity_type"
  add_index "posts", ["parent_id"], :name => "index_posts_on_parent_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.boolean  "sex"
    t.date     "date_of_birth"
    t.string   "avatar"
    t.datetime "last_seen_at"
    t.string   "status"
    t.string   "lives_in"
    t.string   "hometown"
    t.integer  "account_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "users", ["account_id"], :name => "index_users_on_account_id", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

end
