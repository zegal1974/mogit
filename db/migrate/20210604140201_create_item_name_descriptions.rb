class CreateItemNameDescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :item_name_descriptions do |t|
      t.string :description
      t.integer :color
    end
  end
end
