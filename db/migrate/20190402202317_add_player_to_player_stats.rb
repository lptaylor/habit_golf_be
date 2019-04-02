class AddPlayerToPlayerStats < ActiveRecord::Migration[5.2]
  def change
    change_table do |t|
      t.references :players, foreign_key: true
    end
  end
end
