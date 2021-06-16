class CreateItemSubClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :item_sub_classes do |t|
      t.string :name
      t.belongs_to :parent
    end
  end
end
