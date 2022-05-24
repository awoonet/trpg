class GamesAdmin < ApplicationRecord
  belongs_to :games
  belongs_to :admins, class_name: "User"
end
