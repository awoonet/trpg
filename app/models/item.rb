class Item < ApplicationRecord
  belongs_to :game

  validates :name, presence: true

  scope :for_game, ->(id) do 
    where(game_id: id)
  end
end
