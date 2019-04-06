class Shot < ApplicationRecord
  after_save PlayerStat.update_stats(self.last.player_id, self.last.rating)
  belongs_to :club
  belongs_to :player
end
