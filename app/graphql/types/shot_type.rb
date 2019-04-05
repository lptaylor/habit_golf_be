module Types
  class ShotType < BaseObject
    field :id, ID, null: false
    field :rating, Integer, null: false
    field :club_id, Integer, null: false
    field :player_id, Integer, null: false
  end
end
