class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :photo

  def photo
    object.most_liked_user_plant_photo
  end
  
end
