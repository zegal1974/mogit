class CreateItemAppearances < ActiveRecord::Migration[6.1]
  def change
    create_table :item_appearances do |t|
      t.integer :display_type
      t.integer :icon_file_data_id
      t.integer :order, default: 0
      t.belongs_to :player_condition
      t.boolean :is_collected, default: false
      t.boolean :is_hide, default: false
    end
  end
end
