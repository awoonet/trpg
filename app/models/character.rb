class Character < ApplicationRecord
  belongs_to :user
  belongs_to :game
  
  has_many :posts
  
  validates :name, presence:  true

  mount_uploader :avatar, AvatarUploader

  scope :for_game, -> (game_id) { where(game_id: game_id) }  
  scope :for_user, -> (user_id) { where(user_id: user_id) }

  def items = Item.where(id: item_ids)
  def skills = Skill.where(id: skill_ids)
end
