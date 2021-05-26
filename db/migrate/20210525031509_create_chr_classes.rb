class CreateChrClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :chr_classes do |t|
      t.string :name
      t.string :fname
      t.string :description
      t.integer :icon_file_data_id
      t.integer :bg_color

      t.timestamps
    end
  end
end
