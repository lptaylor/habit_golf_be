class PlayerStat < ApplicationRecord
  belongs_to :player


  def self.stats(rating, player_id)
    (Shot.where("shots.player_id = #{player_id} AND shots.rating = #{rating}")).count / (Shot.where(player_id: player_id)).count * 100
  end

  def self.determine_shot_type(rating)
    case rating
    when 1
      "hook_percentage"
    when 2
      "pull_percentage"
    when 3
      "great_shot_percentage"
    when 4
      "push_percentage"
    when 5
      "slice_percentage"
    when 6
      "duff_percentage"
    end
  end

  def self.update_stats(rating, player_id)
    shot_type = determine_shot_type(rating)
    where(player_id: player_id).first.update("#{shot_type}": "#{stats(rating,player_id)}")
    # .("UPDATE player_stats SET #{shot_type} = #{stats(rating, player_id)}")
  end
end
