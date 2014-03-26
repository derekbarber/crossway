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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140326211808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.datetime "published_at"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "status"
    t.string   "slug"
  end

  add_index "articles", ["slug"], name: "index_articles_on_slug", using: :btree

  create_table "book_categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "author"
    t.string   "image"
    t.integer  "book_category_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_image_galleries", force: true do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: true do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "pages", force: true do |t|
    t.string   "title"
    t.string   "permalink"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  add_index "pages", ["permalink"], name: "index_pages_on_permalink", using: :btree

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.text     "content"
    t.integer  "role"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "display_order"
  end

  create_table "sermon_series", force: true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.string   "banner_image"
    t.string   "button_image"
    t.boolean  "current_series"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sermons", force: true do |t|
    t.string   "title"
    t.integer  "sermon_series_id"
    t.date     "date"
    t.string   "scripture_reference"
    t.text     "description"
    t.string   "speaker"
    t.text     "audio_file"
    t.text     "video_embed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "audio_file_duration"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
