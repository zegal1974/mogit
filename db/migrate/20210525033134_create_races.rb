class CreateRaces < ActiveRecord::Migration[6.1]
  def change
    create_table :races do |t|
      t.string :name
      t.string :prefix_name
      t.string :fname
      t.string :description

      t.timestamps
    end
  end
end
