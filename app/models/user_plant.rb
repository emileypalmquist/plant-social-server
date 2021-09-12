class UserPlant < ApplicationRecord
  belongs_to :user
  belongs_to :plant

  has_many :comments, dependent: :destroy
  
  has_many :likes, as: :likeable, dependent: :destroy

  # notes by owner of this plant
  has_many :care_notes, dependent: :destroy



  #image for the plant
  has_one_attached :photo
end
