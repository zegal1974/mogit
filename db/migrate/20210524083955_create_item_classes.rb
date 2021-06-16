class CreateItemClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :item_classes do |t|
      t.string :name
    end
  end
end
