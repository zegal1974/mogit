class CreateAchievements < ActiveRecord::Migration[6.1]
  def change
    create_table :achievements do |t|
      t.string :name
      t.string :description
      t.string :reward
      t.belongs_to :instance
      t.belongs_to :faction
      t.belongs_to :supercede
      t.belongs_to :category
      t.integer :points
      t.integer :flags
      t.integer :order
      t.belongs_to :icon_file
      t.belongs_to :reward_item
      t.integer :minimum_criteria
      t.integer :criteria_tree
      t.integer :shares_criteria
      t.belongs_to :covenant
    end
  end
end
