module Types
  class ClubType < BaseObject
    field :id, ID, null: false
    field :style_of_club, Integer, null: false
    field :rating, Integer, null: false
    field :shots, [Types::ShotType], null: false
  end
end
