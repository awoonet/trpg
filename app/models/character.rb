class Character < ApplicationRecord
  belongs_to :user
  belongs_to :game
  
  has_many :posts
  
  validates :name, presence:  true

  mount_uploader :avatar, AvatarUploader
end
