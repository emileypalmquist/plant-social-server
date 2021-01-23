class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :zone, :experience_level

  has_many :user_plants
  has_many :favorite_plant_species
  # has_many :favorite_plant_species, through: :favorites, source: :plant
end
