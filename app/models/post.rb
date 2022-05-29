class Post < ApplicationRecord  
  belongs_to :character
  belongs_to :location

  validates :content, presence: true
end
