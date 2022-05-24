class Game < ApplicationRecord
  validates :name, presence: true

  has_many :locations
  has_many :characters
  
  has_many :games_admins
  has_many :admins, through: :games_admins
end
