class CreateItemSources < ActiveRecord::Migration[6.1]
  def change
    create_table :item_sources do |t|
      t.string :text
      t.integer :pvp_faction
      t.integer :source_type
    end
  end
end
