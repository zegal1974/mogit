class CreateAchievementCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :achievement_categories do |t|
      t.string :name
      t.belongs_to :parent
      t.integer :order
    end
  end
end
