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

ActiveRecord::Schema.define(version: 20170406025522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string   "company"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "business_type"
    t.string   "project_type"
    t.string   "platforms"
    t.string   "budget"
    t.string   "referral_source"
    t.text     "body"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "image"
    t.string   "hero_image"
    t.text     "short_description"
    t.text     "description"
    t.integer  "service_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["service_id"], name: "index_packages_on_service_id", using: :btree
  end

  create_table "project_attachments", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["attachable_id", "attachable_type"], name: "index_project_attachments_on_attachable_id_and_attachable_type", using: :btree
    t.index ["project_id"], name: "index_project_attachments_on_project_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "subtitle"
    t.text     "what"
    t.text     "how"
    t.string   "quote"
    t.string   "hero_image"
    t.string   "homepage_image"
    t.string   "primary_image"
    t.string   "secondary_image"
    t.boolean  "published"
    t.datetime "published_at"
    t.integer  "position"
    t.integer  "package_id"
    t.string   "template_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["package_id"], name: "index_projects_on_package_id", using: :btree
  end

  create_table "service_segments", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_service_segments_on_service_id", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "hero_image"
    t.text     "short_description"
    t.text     "description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "position",          default: 0
    t.string   "image"
    t.string   "subtitle"
  end

  create_table "technologies", force: :cascade do |t|
    t.string   "name"
    t.string   "subtitle"
    t.string   "slug"
    t.string   "image"
    t.string   "hero_image"
    t.text     "short_description"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "about"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "position"
    t.string   "dribbble_uri"
    t.string   "twitter_uri"
    t.string   "instagram_uri"
    t.string   "github_uri"
    t.string   "linked_in_uri"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
