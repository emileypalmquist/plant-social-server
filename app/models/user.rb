class User < ApplicationRecord
    #plants user owns
    has_many :user_plants, dependent: :destroy
    has_many :care_notes, through: :user_plants

    has_many :comments, dependent: :destroy

    #plant species user has
    has_many :plants, through: :user_plants

    #plant species the user likes
    has_many :favorites, dependent: :destroy
    has_many :favorite_plant_species, through: :favorites, source: :plant

    has_many :likes, as: :likeable, dependent: :destroy

    # #active storage image
    # has_one_attached :profile_photo

    #password encryption
    has_secure_password
    validates :username, uniqueness: true
end
