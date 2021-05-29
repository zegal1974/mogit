class CreateTransmogSetGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :transmog_set_groups do |t|
      t.string :name
    end
  end
end
