class Player < ApplicationRecord
  has_many :player_stats
  has_many :player_clubs
  has_many :clubs, through: :player_clubs
end
