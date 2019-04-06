class Shot < ApplicationRecord
  after_save :add_to_db
  belongs_to :club
  belongs_to :player

  def add_to_db
    PlayerStat.update_stats(self.player_id)
  end

end
