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

ActiveRecord::Schema.define(version: 2021_03_24_181229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string "slug"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ticker"
  end

  create_table "margins", force: :cascade do |t|
    t.integer "base_id", null: false
    t.integer "quote_id", null: false
    t.decimal "margin", precision: 20, scale: 10, default: "0.0", null: false
    t.decimal "decimal", precision: 20, scale: 10, default: "0.0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "markets", force: :cascade do |t|
    t.string "slug"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pairs", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.integer "base_id", null: false
    t.integer "quote_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "market_id"
    t.decimal "rate", precision: 20, scale: 10, default: "0.0", null: false
    t.decimal "price_btc", precision: 20, scale: 10, default: "0.0", null: false
  end

  create_table "triangles", force: :cascade do |t|
    t.bigint "pair_a_id", null: false
    t.bigint "pair_b_id", null: false
    t.bigint "pair_c_id", null: false
    t.decimal "rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pair_a_id"], name: "index_triangles_on_pair_a_id"
    t.index ["pair_b_id"], name: "index_triangles_on_pair_b_id"
    t.index ["pair_c_id"], name: "index_triangles_on_pair_c_id"
  end

end
