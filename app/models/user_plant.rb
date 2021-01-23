class UserPlant < ApplicationRecord
  belongs_to :user
  belongs_to :plant

  # notes by owner of this plant
  has_many :care_notes, dependent: :destroy
end
