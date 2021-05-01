class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :scientific_name, :trefle_api_id, :image_url
end
