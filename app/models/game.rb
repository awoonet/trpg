class Game < ApplicationRecord
  has_many :locations
  has_many :characters

  validates :name, presence: true

  mount_uploader :avatar, AvatarUploader
end
