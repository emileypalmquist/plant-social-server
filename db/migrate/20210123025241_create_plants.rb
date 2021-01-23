class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :scientific_name
      t.integer :trefle_api_id

      t.timestamps
    end
  end
end
