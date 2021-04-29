class CommentSerializer < ActiveModel::Serializer
    attributes :id, :content, :user_plant_id, :created_at, :user_id
    has_many :likes
  end