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

ActiveRecord::Schema.define(version: 20170111200754) do

  create_table "categories", force: :cascade do |t|
    t.string   "category_type", limit: 50, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.string   "data_fingerprint",  limit: 255
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "ckeditor_assets", ["type"], name: "index_ckeditor_assets_on_type", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id",      limit: 4, null: false
    t.integer  "recipe_id",    limit: 4, null: false
    t.integer  "rating_value", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "recipe_name",             limit: 100,   null: false
    t.integer  "user_id",                 limit: 4,     null: false
    t.integer  "category_id",             limit: 4,     null: false
    t.text     "content",                 limit: 65535, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "recipe_img_file_name",    limit: 255
    t.string   "recipe_img_content_type", limit: 255
    t.integer  "recipe_img_file_size",    limit: 4
    t.datetime "recipe_img_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "encrypted_password",     limit: 255,               null: false
    t.string   "name",                   limit: 100,               null: false
    t.string   "email",                  limit: 200,               null: false
    t.text     "address",                limit: 65535
    t.string   "city",                   limit: 255
    t.string   "state",                  limit: 255
    t.string   "pincode",                limit: 255
    t.string   "contact_no",             limit: 15
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
