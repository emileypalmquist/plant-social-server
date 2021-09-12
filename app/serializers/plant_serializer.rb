class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :photo
  has_one :user_plant
  has_many :favorites
  has_many :care_notes

  def photo
    object.most_liked_user_plant_photo
  end
  
end
