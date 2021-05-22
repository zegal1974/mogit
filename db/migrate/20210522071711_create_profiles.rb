class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.datetime :last_update
      t.integer :faction
      t.integer :race
      t.integer :level
      t.integer :claxx
      t.integer :money
      t.integer :gender
      t.integer :played
      t.integer :played_this_level
      t.belongs_to :active_covenant, null: false, foreign_key: true
      t.datetime :last_logout
      t.string :zone
      t.string :sub_zone
      t.string :bind_location

      t.timestamps
    end
  end
end
