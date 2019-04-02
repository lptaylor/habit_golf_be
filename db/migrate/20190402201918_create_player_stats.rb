class CreatePlayerStats < ActiveRecord::Migration[5.2]
  def change
    create_table :player_stats do |t|
      t.float :hook_percentage
      t.float :pull_percentage
      t.float :great_shot_percentage
      t.float :push_percentage
      t.float :slice_percentage

      t.timestamps
    end
  end
end
