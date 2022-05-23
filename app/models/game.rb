class Game < ApplicationRecord
  validates :name, presence: true

  has_many :locations
  has_many :characters
end
