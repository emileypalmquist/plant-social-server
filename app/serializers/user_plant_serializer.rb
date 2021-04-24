class UserPlantSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :difficulty, :indoor, :moisture, :photo, :plant, :user_id, :care_notes
  belongs_to :plant
  has_many :care_notes

  def photo
    if object.photo.attached? 
      rails_blob_path(object.photo, only_path: true)
    else
      #default image if none was uploaded
      'https://images.unsplash.com/photo-1597305877032-0668b3c6413a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80'
    end
  end
end
