class Location < ApplicationRecord
  belongs_to :game
  
  has_many :posts

  validates :name, presence: true

  mount_uploader :avatar, AvatarUploader

  scope :for_game, -> (game_id) do
    Location.where(game_id: game_id, parent_location_id: nil)
  end

  def parent_location
    if parent_location_id
      Location.find_by(id: parent_location_id)
    end
  end

  def child_locations
    if child_locations_ids
      Locations.where(id: child_locations_ids)
    end
  end
end
