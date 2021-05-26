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

ActiveRecord::Schema.define(version: 2021_05_26_060152) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.datetime "last_update"
    t.integer "faction_id", null: false
    t.integer "race_id", null: false
    t.integer "level"
    t.integer "chr_class_id", null: false
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
    t.index ["active_covenant_id"], name: "index_characters_on_active_covenant_id"
    t.index ["chr_class_id"], name: "index_characters_on_chr_class_id"
    t.index ["faction_id"], name: "index_characters_on_faction_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
  end

  create_table "chr_classes", force: :cascade do |t|
    t.string "name"
    t.string "fname"
    t.string "description"
    t.integer "icon_file_data_id"
    t.integer "bg_color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "faction_groups", force: :cascade do |t|
    t.integer "did"
    t.string "name"
    t.string "internal_name"
    t.integer "mask_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "factions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_factions_on_parent_id"
  end

  create_table "item_appearances", force: :cascade do |t|
    t.integer "display_type"
    t.integer "icon_file_data_id"
    t.integer "order", default: 0
    t.integer "player_condition_id"
    t.boolean "is_collected", default: false
    t.boolean "is_hide", default: false
  end

  create_table "item_classes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "item_sub_classes", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_item_sub_classes_on_parent_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "item_class_id"
    t.integer "item_sub_class_id"
    t.integer "quality"
    t.integer "allowable_race"
    t.integer "inventory_type"
    t.integer "sheathe_type"
    t.integer "icon_file_data_id"
    t.integer "level", default: 0
    t.integer "min_level"
    t.integer "stack_count"
    t.integer "bind_type"
    t.integer "set_id"
    t.integer "appearance_id"
    t.integer "source_type"
    t.string "description"
    t.index ["appearance_id"], name: "index_items_on_appearance_id"
    t.index ["item_class_id"], name: "index_items_on_item_class_id"
    t.index ["item_sub_class_id"], name: "index_items_on_item_sub_class_id"
    t.index ["set_id"], name: "index_items_on_set_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.string "prefix_name"
    t.string "fname"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
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

  add_foreign_key "characters", "active_covenants"
  add_foreign_key "characters", "chr_classes"
  add_foreign_key "characters", "factions"
  add_foreign_key "characters", "races"
end
