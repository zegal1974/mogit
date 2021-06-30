class CreateReputations < ActiveRecord::Migration[6.1]
  def change
    create_table :reputations do |t|
      t.belongs_to :faction, null: false, foreign_key: true
      t.belongs_to :character, null: false, foreign_key: true
      t.integer :earned
      t.integer :level
      t.integer :value

      t.timestamps
    end
  end
end
