class AddDuffToPlayerStats < ActiveRecord::Migration[5.2]
  def change
    add_column :player_stats, :duff_percentage, :float
  end
end
