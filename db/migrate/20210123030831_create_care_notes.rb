class CreateCareNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :care_notes do |t|
      t.references :user_plant, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
