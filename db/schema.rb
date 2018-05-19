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

ActiveRecord::Schema.define(version: 20180519054410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string "original", null: false
    t.string "filename", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["filename"], name: "index_assets_on_filename"
    t.index ["type"], name: "index_assets_on_type"
  end

  create_table "assets_modules", force: :cascade do |t|
    t.string "type", null: false
    t.bigint "assets_id"
    t.string "module_type"
    t.bigint "module_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assets_id"], name: "index_assets_modules_on_assets_id"
    t.index ["module_type", "module_id"], name: "index_assets_modules_on_module_type_and_module_id"
    t.index ["type"], name: "index_assets_modules_on_type"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.integer "price", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "code", null: false
    t.string "email"
    t.integer "total_payment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_orders_on_code"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.string "slug", null: false
    t.integer "price", null: false
    t.integer "quantity", null: false
    t.datetime "available_on", null: false
    t.datetime "discontinue_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["available_on"], name: "index_products_on_available_on"
    t.index ["code"], name: "index_products_on_code"
    t.index ["slug"], name: "index_products_on_slug"
  end

  create_table "taxonomies", force: :cascade do |t|
    t.string "name", null: false
    t.string "code"
    t.string "slug", null: false
    t.integer "position", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_taxonomies_on_code"
    t.index ["position"], name: "index_taxonomies_on_position"
    t.index ["slug"], name: "index_taxonomies_on_slug"
  end

  create_table "taxonomies_products", force: :cascade do |t|
    t.bigint "taxonomy_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_taxonomies_products_on_product_id"
    t.index ["taxonomy_id", "product_id"], name: "index_taxonomies_products_on_taxonomy_id_and_product_id", unique: true
    t.index ["taxonomy_id"], name: "index_taxonomies_products_on_taxonomy_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "is_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["password_digest"], name: "index_users_on_password_digest"
  end

end
