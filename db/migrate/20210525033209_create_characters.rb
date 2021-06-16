class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.belongs_to :realm
      t.datetime :last_update
      t.belongs_to :race#, null: false#, foreign_key: true
      t.integer :level
      t.belongs_to :chr_class#, null: false#, foreign_key: true
      t.integer :money, default: 0
      t.integer :gender
      t.integer :played
      t.integer :played_this_level
      t.belongs_to :active_covenant#, null: false#, foreign_key: true
      t.datetime :last_logout
      t.string :zone
      t.string :sub_zone
      t.string :bind_location

      t.timestamps
    end
  end
end
