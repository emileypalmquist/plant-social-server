class Like < ApplicationRecord

  belongs_to :user
  belongs_to :likeable, polymorphic: true
  validates :likeable_id, uniqueness: {scope: [:user_id, :likeable_type]}

  def user_plant
    if likeable_type === "UserPlant"
      likeable.attributes.merge({plant: likeable.plant, photo: rails_blob_path(likeable.photo, only_path: true)})
    end
  end
end
