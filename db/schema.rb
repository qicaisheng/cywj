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

ActiveRecord::Schema.define(version: 20150724144146) do

  create_table "authors", force: :cascade do |t|
    t.string   "mobile",      limit: 255
    t.string   "job",         limit: 255
    t.string   "major",       limit: 255
    t.text     "description", limit: 16777215
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id",     limit: 4
    t.integer  "status",      limit: 4
    t.string   "name",        limit: 255
    t.boolean  "is_right",    limit: 1
  end

  add_index "authors", ["user_id"], name: "index_authors_on_user_id", using: :btree

  create_table "chapter_comments", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "novel_id",   limit: 4
    t.integer  "chapter_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "chapter_comments", ["chapter_id"], name: "index_chapter_comments_on_chapter_id", using: :btree
  add_index "chapter_comments", ["novel_id"], name: "index_chapter_comments_on_novel_id", using: :btree
  add_index "chapter_comments", ["user_id"], name: "index_chapter_comments_on_user_id", using: :btree

  create_table "chapters", force: :cascade do |t|
    t.integer  "number",     limit: 4
    t.string   "name",       limit: 255
    t.text     "content",    limit: 16777215
    t.string   "keywords",   limit: 255
    t.integer  "novel_id",   limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "status",     limit: 4
  end

  add_index "chapters", ["novel_id"], name: "index_chapters_on_novel_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "chapter_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "comments", ["chapter_id"], name: "index_comments_on_chapter_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "novels", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "type",        limit: 255
    t.string   "cover",       limit: 255
    t.string   "keywords",    limit: 255
    t.string   "description", limit: 255
    t.integer  "author_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "is_show",     limit: 1
  end

  add_index "novels", ["author_id"], name: "index_novels_on_author_id", using: :btree

  create_table "redactor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 255
    t.string   "mobile",                 limit: 255
    t.string   "job",                    limit: 255
    t.string   "major",                  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "chapter_comments", "chapters"
  add_foreign_key "chapter_comments", "novels"
  add_foreign_key "chapter_comments", "users"
  add_foreign_key "chapters", "novels"
  add_foreign_key "comments", "chapters"
  add_foreign_key "comments", "users"
  add_foreign_key "novels", "authors"
end
