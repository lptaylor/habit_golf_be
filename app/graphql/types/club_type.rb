module Types
  class ClubType < BaseObject
    field :style_of_club, Integer, null: false
    field :rating, Integer, null: false
    field :shots, [Types::ShotType], null: false
  end
end
