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

ActiveRecord::Schema.define(version: 2019_11_11_143234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "owned_trends", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.boolean "promoted_content"
    t.string "query"
    t.integer "initial_tweet_volume"
    t.integer "current_tweet_volume"
    t.integer "initial_rank"
    t.integer "current_rank"
    t.float "initial_valuation"
    t.float "current_valuation"
    t.float "change_percent_volume"
    t.float "change_percent_valuation"
    t.integer "quantity_trends_purchased"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_owned_trends_on_user_id"
  end

  create_table "trends", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "query"
    t.string "tweet_volume"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "account_balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "owned_trends", "users"
end
