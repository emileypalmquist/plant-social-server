class Plant < ApplicationRecord
    #users who own a plant of this species
    has_many :user_plants, dependent: :destroy
    has_many :users, through: :user_plants

    #users who favorite this plant species
    has_many :favorites, dependent: :destroy
    has_many :users_favorite, through: :favorites, source: :user

    def most_liked_user_plant
        user_plants.includes(:likes).max_by{|p| p.likes.length}
    end

    def most_liked_user_plant_photo
        if user_plants.length > 0
            user_plant = most_liked_user_plant
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

    def user_plant
        if user_plants.length > 0
            up = most_liked_user_plant
            {id: up.id,  name: up.name}
        end
    end

    def care_notes
        care_notes = CareNote.where(user_plant_id: user_plants.ids)
        most_likes = Like.includes(likeable: [:user_plant]).select('id, likeable_id, likeable_type, user_id, count(likeable_id) as cnt')
            .where(likeable_id: care_notes.ids, likeable_type: 'CareNote')
            .group('likeable_id, likeable_type, user_id, id').order('cnt DESC').limit(5)
        if most_likes.length > 0
            cns = most_likes.map {|l| l.likeable }.uniq
            if cns.length < 5
                ids = cns.map{|cn| cn.id}
                return cns + care_notes.where.not(id: ids).limit(5 - cns.length)
            end
            cns
        else
            care_notes.limit(5)
        end
      
    end

end
