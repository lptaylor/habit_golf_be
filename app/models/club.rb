class Club < ApplicationRecord
  has_many :shots
  has_many :player_clubs
  has_many :players, through: :player_clubs
end
