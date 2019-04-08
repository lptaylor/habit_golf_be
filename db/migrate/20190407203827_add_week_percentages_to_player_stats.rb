class AddWeekPercentagesToPlayerStats < ActiveRecord::Migration[5.2]
  def change
    add_column :player_stats, :week_hook_percentage, :float
    add_column :player_stats, :week_pull_percentage, :float
    add_column :player_stats, :week_duff_percentage, :float
    add_column :player_stats, :week_slice_percentage, :float
    add_column :player_stats, :week_great_shot_percentage, :float
    add_column :player_stats, :week_push_percentage, :float
  end
end
