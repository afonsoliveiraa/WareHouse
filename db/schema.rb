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

ActiveRecord::Schema[7.1].define(version: 2024_07_25_183057) do
  create_table "entries", force: :cascade do |t|
    t.date "date_entry"
    t.string "number"
    t.integer "pa_id", null: false
    t.integer "person_id", null: false
    t.decimal "total"
    t.string "modality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pa_id"], name: "index_entries_on_pa_id"
    t.index ["person_id"], name: "index_entries_on_person_id"
  end

  create_table "entry_items", force: :cascade do |t|
    t.integer "entry_id", null: false
    t.integer "item_id", null: false
    t.integer "quantity"
    t.decimal "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_entry_items_on_entry_id"
    t.index ["item_id"], name: "index_entry_items_on_item_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "description"
    t.string "pcasp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "description"
    t.integer "group_id", null: false
    t.integer "unit_id", null: false
    t.text "specification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_items_on_group_id"
    t.index ["unit_id"], name: "index_items_on_unit_id"
  end

  create_table "pas", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.string "objective"
    t.date "start_date"
    t.date "end_date"
    t.integer "uo_id", null: false
    t.string "horizon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uo_id"], name: "index_pas_on_uo_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.date "birthdate"
    t.string "phone"
    t.string "address"
    t.string "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "description"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uos", force: :cascade do |t|
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.string "kind"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "entries", "pas"
  add_foreign_key "entries", "people"
  add_foreign_key "entry_items", "entries"
  add_foreign_key "entry_items", "items"
  add_foreign_key "items", "groups"
  add_foreign_key "items", "units"
  add_foreign_key "pas", "uos"
end
