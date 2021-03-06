class Game < ApplicationRecord
  has_many :locations
  has_many :characters

  has_many :skills
  has_many :items

  validates :name, presence: true

  mount_uploader :avatar, AvatarUploader

  scope :signed_in?, ->(user) do
    if !user
      where(nsfw: false, whitelisted: false)
    else
      where(whitelisted: false).or(where(":id = ANY(whitelist)", whitelisted: true, id: user.id))
    end
  end
end
