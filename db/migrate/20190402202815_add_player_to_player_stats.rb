class AddPlayerToPlayerStats < ActiveRecord::Migration[5.2]
  def change
    change_table :player_stats do |t|
      t.references :player, foreign_key: true
    end
  end
end
