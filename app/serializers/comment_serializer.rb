class CommentSerializer < ActiveModel::Serializer
    attributes :id, :content, :user_plant_id, :created_at
    has_many :likes
    has_one :user
  end