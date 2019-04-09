class PlayerStat < ApplicationRecord
  belongs_to :player

  def self.stats(rating, player_id)
    shot_data = get_all_data(rating, player_id)
    ((shot_data.first.shots_in_rating.to_f / shot_data.first.shots_for_table.to_f) * 100).round
  end

  def self.get_all_data(rating, player_id)
    Shot.find_by_sql("SELECT
                      SUM(CASE WHEN (shots.player_id = #{player_id} AND shots.rating = #{rating}) THEN 1 ELSE 0 END) AS shots_in_rating,
                      SUM(CASE WHEN (shots.player_id = #{player_id}) THEN 1 ELSE 0 END) AS shots_for_table
                      FROM shots")
  end

  def self.today_stats(rating, player_id)
    shots_data = get_today_data(rating, player_id)
    ((shots_data.first.shots_in_rating.to_f / shots_data.first.shots_for_table.to_f) * 100).round
  end

  def self.get_today_data(rating, player_id)
    Shot.find_by_sql("SELECT
                      SUM(CASE WHEN (shots.player_id = #{player_id} AND shots.rating = #{rating} AND shots.created_at >= CURRENT_DATE) THEN 1 ELSE 0 END) AS shots_in_rating,
                      SUM(CASE WHEN (shots.player_id = #{player_id} AND shots.created_at >= CURRENT_DATE) THEN 1 ELSE 0 END) AS shots_for_table
                      FROM shots")
  end

  def self.update_stats(player_id)
    where(player_id: player_id).update({hook_percentage: "#{stats(1,player_id)}",
                                        pull_percentage: "#{stats(2,player_id)}",
                                        great_shot_percentage: "#{stats(3,player_id)}",
                                        push_percentage: "#{stats(4,player_id)}",
                                        slice_percentage: "#{stats(5,player_id)}",
                                        duff_percentage: "#{stats(6,player_id)}",
                                        today_hook_percentage: "#{today_stats(1,player_id)}",
                                        today_pull_percentage: "#{today_stats(2,player_id)}",
                                        today_great_shot_percentage: "#{today_stats(3,player_id)}",
                                        today_push_percentage: "#{today_stats(4,player_id)}",
                                        today_slice_percentage: "#{today_stats(5,player_id)}",
                                        today_duff_percentage: "#{today_stats(6,player_id)}"})
  end
end
