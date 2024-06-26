# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_17_195050) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "blog_posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "content"
    t.string "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blog_posts_on_user_id"
  end

  create_table "blog_posts_tags", id: false, force: :cascade do |t|
    t.bigint "blog_post_id", null: false
    t.bigint "tag_id", null: false
    t.index ["blog_post_id", "tag_id"], name: "index_blog_posts_tags_on_blog_post_id_and_tag_id"
    t.index ["tag_id", "blog_post_id"], name: "index_blog_posts_tags_on_tag_id_and_blog_post_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_likes_on_product_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "description"
    t.string "category"
    t.string "tags"
    t.string "price"
    t.string "condition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "products_tags", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "tag_id", null: false
    t.index ["product_id", "tag_id"], name: "index_products_tags_on_product_id_and_tag_id"
    t.index ["tag_id", "product_id"], name: "index_products_tags_on_tag_id_and_product_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "bio"
    t.string "location"
    t.string "contact_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "profile_picture"
    t.string "social_media_id"
    t.boolean "is_seller"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "admins", "users"
  add_foreign_key "blog_posts", "users"
  add_foreign_key "likes", "products"
  add_foreign_key "likes", "users"
  add_foreign_key "products", "users"
end
