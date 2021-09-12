class CareNoteSerializer < ActiveModel::Serializer
    attributes :id, :content, :user_plant_id, :created_at, :likes
   
end