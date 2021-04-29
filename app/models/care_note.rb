class CareNote < ApplicationRecord
  belongs_to :user_plant
  has_many :likes, as: :likeable
end
