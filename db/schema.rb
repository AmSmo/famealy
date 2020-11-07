# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_06_225653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.integer "spoon_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "possible_units", default: [], array: true
    t.string "image_url"
  end

  create_table "potluck_recipes", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "potluck_id", null: false
    t.time "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["potluck_id"], name: "index_potluck_recipes_on_potluck_id"
    t.index ["recipe_id"], name: "index_potluck_recipes_on_recipe_id"
    t.index ["user_id"], name: "index_potluck_recipes_on_user_id"
  end

  create_table "potlucks", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "ingredient_id", null: false
    t.float "amount"
    t.string "amount_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "spoon_id"
    t.string "description"
    t.integer "time"
    t.string "directions"
    t.float "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "directions_json"
    t.string "image_url"
  end

  create_table "supplied_ingredients", force: :cascade do |t|
    t.bigint "potluck_id", null: false
    t.float "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "amount_type"
    t.bigint "ingredient_id"
    t.bigint "user_id"
    t.index ["ingredient_id"], name: "index_supplied_ingredients_on_ingredient_id"
    t.index ["potluck_id"], name: "index_supplied_ingredients_on_potluck_id"
    t.index ["user_id"], name: "index_supplied_ingredients_on_user_id"
  end

  create_table "trip_potlucks", force: :cascade do |t|
    t.bigint "potluck_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["potluck_id"], name: "index_trip_potlucks_on_potluck_id"
    t.index ["trip_id"], name: "index_trip_potlucks_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.date "start_date"
    t.date "end_date"
    t.float "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_ingredients", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "ingredient_id", null: false
    t.float "amount"
    t.string "amount_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_user_ingredients_on_ingredient_id"
    t.index ["user_id"], name: "index_user_ingredients_on_user_id"
  end

  create_table "user_potlucks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "potluck_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["potluck_id"], name: "index_user_potlucks_on_potluck_id"
    t.index ["user_id"], name: "index_user_potlucks_on_user_id"
  end

  create_table "user_recipes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.integer "rating"
    t.string "review"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_user_recipes_on_recipe_id"
    t.index ["user_id"], name: "index_user_recipes_on_user_id"
  end

  create_table "user_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "friend"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "location"
    t.string "password_digest"
    t.string "email_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "potluck_recipes", "potlucks"
  add_foreign_key "potluck_recipes", "recipes"
  add_foreign_key "recipe_ingredients", "ingredients"
  add_foreign_key "recipe_ingredients", "recipes"
  add_foreign_key "supplied_ingredients", "potlucks"
  add_foreign_key "trip_potlucks", "potlucks"
  add_foreign_key "trip_potlucks", "trips"
  add_foreign_key "user_ingredients", "ingredients"
  add_foreign_key "user_ingredients", "users"
  add_foreign_key "user_potlucks", "potlucks"
  add_foreign_key "user_potlucks", "users"
  add_foreign_key "user_recipes", "recipes"
  add_foreign_key "user_recipes", "users"
  add_foreign_key "user_users", "users"
end
