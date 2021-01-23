class UserPlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :difficulty, :indoor, :moisture, :plant_id
  belongs_to :plant
end
