class Plant < ApplicationRecord
    #users who own a plant of this species
    has_many :user_plants, dependent: :destroy
    has_many :users, through: :user_plants

    #users who favorite this plant species
    has_many :favorites, dependent: :destroy
    has_many :users_favorite, through: :favorites, source: :user

end
