class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :user_plant
  has_many :likes, as: :likeable
end
