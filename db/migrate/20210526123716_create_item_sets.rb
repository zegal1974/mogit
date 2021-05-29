class CreateItemSets < ActiveRecord::Migration[6.1]
  def change
    create_table :item_sets do |t|
      t.string :name
      t.integer :flags
    end
  end
end
