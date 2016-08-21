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

ActiveRecord::Schema.define(version: 20160820165052) do

  create_table "domains", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_domains", force: :cascade do |t|
    t.integer  "page_id"
    t.integer  "domain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "page_domains", ["domain_id"], name: "index_page_domains_on_domain_id"
  add_index "page_domains", ["page_id"], name: "index_page_domains_on_page_id"

  create_table "page_tags", force: :cascade do |t|
    t.integer  "page_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "page_tags", ["page_id"], name: "index_page_tags_on_page_id"
  add_index "page_tags", ["tag_id"], name: "index_page_tags_on_tag_id"

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.boolean  "is_favorite"
    t.string   "memo"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
