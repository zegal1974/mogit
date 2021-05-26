class CreateFactions < ActiveRecord::Migration[6.1]
  def change
    create_table :factions do |t|
      t.string :name
      t.string :description
      t.belongs_to :parent

      t.timestamps
    end
  end
end
