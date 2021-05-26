class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.belongs_to :item_class
      t.belongs_to :item_sub_class
      t.integer :quality
      t.integer :allowable_race
      t.integer :inventory_type
      t.integer :sheathe_type
      t.integer :icon_file_data_id
      t.integer :level, default: 0
      t.integer :min_level
      t.integer :stack_count
      t.integer :bind_type
      t.belongs_to :set
      t.belongs_to :appearance
      t.integer :source_type
      t.string :description
    end
  end
end
