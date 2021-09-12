class Plant < ApplicationRecord
    #users who own a plant of this species
    has_many :user_plants, dependent: :destroy
    has_many :users, through: :user_plants

    #users who favorite this plant species
    has_many :favorites, dependent: :destroy
    has_many :users_favorite, through: :favorites, source: :user

    def most_liked_user_plant_photo
        if user_plants.length > 0
            user_plant = user_plants.includes(:likes).max_by{|p| p.likes.length}
            if user_plant.photo.attached? 
                rails_blob_path(user_plant.photo, only_path: true)
            else
                #default image if none was uploaded
                'https://images.unsplash.com/photo-1597305877032-0668b3c6413a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80'
            end
        else 
            'https://images.unsplash.com/photo-1597305877032-0668b3c6413a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80'
        end
    end

end
