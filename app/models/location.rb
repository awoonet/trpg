class Location < ApplicationRecord
  validates :name, presence: true

  belongs_to :game

  has_many :posts
end
