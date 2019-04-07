class PlayerStat < ApplicationRecord
  belongs_to :player

  def self.stats(rating, player_id)
    (((Shot.where("shots.player_id = #{player_id} AND shots.rating = #{rating}")).count).to_f / (Shot.where(player_id: player_id)).count * 100).round
  end

  def self.today_stats(rating, player_id)
    (((Shot.where("shots.player_id = #{player_id} AND shots.rating = #{rating} AND shots.created_at BETWEEN '2019-04-06 00:00:00' AND '2019-04-07 23:59:59'")).count).to_f / (Shot.where(player_id: player_id)).count * 100).round
    # (((Shot.where("shots.player_id = #{player_id} AND shots.rating = #{rating} AND 'shots.created_at.utc' BETWEEN '#{Time.now.utc.midnight - 1}' AND '#{Time.now.utc.midnight}'")).count).to_f / (Shot.where(player_id: player_id)).count * 100).round
  end

  def self.update_stats(player_id)
    where(player_id: player_id).update({hook_percentage: "#{stats(1,player_id)}",
                                        pull_percentage: "#{stats(2,player_id)}",
                                        great_shot_percentage: "#{stats(3,player_id)}",
                                        push_percentage: "#{stats(4,player_id)}",
                                        slice_percentage: "#{stats(5,player_id)}",
                                        duff_percentage: "#{stats(6,player_id)}"})
  end

  def self.update_today(player_id)
    
    where(player_id: player_id).update({hook_percentage: "#{today_stats(1,player_id)}",
                                        pull_percentage: "#{today_stats(2,player_id)}",
                                        great_shot_percentage: "#{today_stats(3,player_id)}",
                                        push_percentage: "#{today_stats(4,player_id)}",
                                        slice_percentage: "#{today_stats(5,player_id)}",
                                        duff_percentage: "#{today_stats(6,player_id)}"})
  end
end
