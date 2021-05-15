class RemoveAttributesFromPlants < ActiveRecord::Migration[6.1]
  def change
    remove_column :plants, :scientific_name
    remove_column :plants, :trefle_api_id
    remove_column :plants, :image_url
  end
end
