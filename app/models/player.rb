class Player < ApplicationRecord
  has_many :player_stats
  has_many :player_clubs
  has_many :clubs, though: :player_clubs
end
