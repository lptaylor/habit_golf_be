class AddClubsToShots < ActiveRecord::Migration[5.2]
  def change
    change_table :shots do |t|
      t.references :club, foreign_key: true
    end
  end
end
