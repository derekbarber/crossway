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

ActiveRecord::Schema.define(:version => 20130123214134) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.datetime "published_at"
    t.text     "content"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "parent_id"
  end

  add_index "pages", ["permalink"], :name => "index_pages_on_permalink"

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.text     "content"
    t.integer  "role"
    t.boolean  "enabled"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.date     "post_date"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sermon_series", :force => true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.string   "banner_image"
    t.string   "button_image"
    t.boolean  "current_series"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "sermons", :force => true do |t|
    t.string   "title"
    t.integer  "sermon_series_id"
    t.date     "date"
    t.string   "scripture_reference"
    t.text     "description"
    t.string   "speaker"
    t.text     "audio_file"
    t.text     "video_embed"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "name"
  end

end
