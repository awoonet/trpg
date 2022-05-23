class Character < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  belongs_to :game

  has_many :posts
end
