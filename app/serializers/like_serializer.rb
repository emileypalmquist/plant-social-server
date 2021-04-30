class LikeSerializer < ActiveModel::Serializer
  attributes :id, :likeable_id, :user_id
end
