class User < ApplicationRecord
    #plants user owns
    has_many :user_plants, dependent: :destroy
    has_many :care_notes, through: :user_plants

    #plant species user has
    has_many :plants, through: :user_plants

    #plant species user likes
    has_many :favorites, dependent: :destroy
    has_many :favorite_plant_species, through: :favorites, source: :plant

    #password encryption
    has_secure_password
    validates :username, uniqueness: true
end
