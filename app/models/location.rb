class Location < ApplicationRecord
  belongs_to :game
  
  has_many :posts

  validates :name, presence: true

  mount_uploader :avatar, AvatarUploader
end
