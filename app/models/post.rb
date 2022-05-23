class Post < ApplicationRecord
  validates :content, presence: true

  belongs_to :character
  belongs_to :location
end
