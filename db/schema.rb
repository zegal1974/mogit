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

ActiveRecord::Schema.define(version: 2021_05_22_071711) do

  create_table "items", force: :cascade do |t|
    t.integer "did"
    t.string "name"
    t.integer "item_class"
    t.integer "item_sub_class"
    t.integer "quality"
    t.integer "inventory_type"
    t.integer "sheathe_type"
    t.integer "icon_file_data_id"
    t.integer "level"
    t.integer "min_level"
    t.integer "stack_count"
    t.integer "bind_type"
    t.integer "set_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["did"], name: "index_items_on_did"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.datetime "last_update"
    t.integer "faction"
    t.integer "race"
    t.integer "level"
    t.integer "claxx"
    t.integer "money"
    t.integer "gender"
    t.integer "played"
    t.integer "played_this_level"
    t.integer "active_covenant_id", null: false
    t.datetime "last_logout"
    t.string "zone"
    t.string "sub_zone"
    t.string "bind_location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["active_covenant_id"], name: "index_profiles_on_active_covenant_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.integer "did"
    t.integer "inv_type"
    t.integer "visual_id"
    t.integer "category_id"
    t.integer "stype"
    t.boolean "is_collected", default: false
    t.boolean "is_hide", default: false
    t.integer "item_id"
    t.integer "item_mod_id"
    t.integer "quality"
    t.boolean "condition"
    t.string "user_error"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "profiles", "active_covenants"
end
