class CreateUserPlants < ActiveRecord::Migration[6.1]
  def change
    create_table :user_plants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true
      t.string :name
      t.integer :difficulty
      t.integer :moisture
      t.boolean :indoor

      t.timestamps
    end
  end
end
