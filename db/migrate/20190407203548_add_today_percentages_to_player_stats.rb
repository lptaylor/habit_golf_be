class AddTodayPercentagesToPlayerStats < ActiveRecord::Migration[5.2]
  def change
    add_column :player_stats, :today_hook_percentage, :float
    add_column :player_stats, :today_pull_percentage, :float
    add_column :player_stats, :today_duff_percentage, :float
    add_column :player_stats, :today_slice_percentage, :float
    add_column :player_stats, :today_great_shot_percentage, :float
    add_column :player_stats, :today_push_percentage, :float
  end
end
