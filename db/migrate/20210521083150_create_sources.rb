class CreateSources < ActiveRecord::Migration[6.1]
  def change
    create_table :sources do |t|
      t.string :name
      t.integer :did
      t.integer :inv_type
      t.integer :visual_id
      t.integer :category_id
      t.integer :stype
      t.boolean :is_collected, default: false
      t.boolean :is_hide, default: false
      t.integer :item_id
      t.integer :item_mod_id
      t.integer :quality
      t.boolean :condition
      t.string :user_error
      t.string :description

      t.timestamps
    end
  end
end
