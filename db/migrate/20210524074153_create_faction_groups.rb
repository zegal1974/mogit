class CreateFactionGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :faction_groups do |t|
      t.string :name
      t.string :internal_name
      t.integer :mask_id
    end
  end
end
