class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :did, null: false
      t.string :name
      t.integer :item_class
      t.integer :item_sub_class
      t.integer :quality
      t.integer :inventory_type
      t.integer :sheathe_type
      t.integer :icon_file_data_id
      t.integer :level, default: 0
      t.integer :min_level
      t.integer :stack_count
      t.integer :bind_type
      t.integer :set_id

      t.timestamps
    end

    add_index :items, :did
  end
end
