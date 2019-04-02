class PlayerClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :player_clubs do |t|
      t.references :club, foreign_key: true
      t.references :player, foreign_key: true
    end
  end
end
