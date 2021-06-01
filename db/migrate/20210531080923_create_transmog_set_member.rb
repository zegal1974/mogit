class CreateTransmogSetMember < ActiveRecord::Migration[6.1]
  def change
    create_table :transmog_set_members do |t|
      t.belongs_to :transmog_set, null: false
      t.belongs_to :item_appearance, null: false
      t.integer :flags, default: 0

      # t.index :transmog_set_id
      # t.index :item_appearance_id
    end
  end
end
