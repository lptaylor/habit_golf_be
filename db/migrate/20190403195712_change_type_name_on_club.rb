class ChangeTypeNameOnClub < ActiveRecord::Migration[5.2]
  def change
    rename_column :clubs, :type, :style_of_club
  end
end
