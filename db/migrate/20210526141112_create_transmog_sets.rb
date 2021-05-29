class CreateTransmogSets < ActiveRecord::Migration[6.1]
  def change
    create_table :transmog_sets do |t|
      t.string :name
      t.integer :class_mask
      t.belongs_to :group, null: false#, foreign_key: true
      t.string :flags
      t.belongs_to :tracking_quest#, null: false#, foreign_key: true
      t.belongs_to :item_name_description#, null: false#, foreign_key: true
      t.belongs_to :parent#, null: false#, foreign_key: true
      t.integer :order
    end
  end
end
