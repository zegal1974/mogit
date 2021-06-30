class CreateFactions < ActiveRecord::Migration[6.1]
  def change
    create_table :factions do |t|
      t.string :name
      t.string :description
      t.integer :reputation_index, default: -1
      t.integer :expansion
      t.integer :race_mask_0, default: 0
      t.integer :race_mask_1, default: 0
      t.integer :race_mask_2, default: 0
      t.integer :race_mask_3, default: 0
      t.integer :class_mask_0, default: 0
      t.integer :class_mask_1, default: 0
      t.integer :class_mask_2, default: 0
      t.integer :class_mask_3, default: 0
      t.belongs_to :parent, null: true
      t.belongs_to :group, null: true
    end
  end
end
