class Skill < ApplicationRecord
  belongs_to :game

  validates :name, presence: true

  scope :for_game, ->(id) { where(game_id: id) }
end
