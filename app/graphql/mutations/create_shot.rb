module Mutations
  class CreateShot < BaseMutation

    argument :club_id, Integer, required: true
    argument :rating, Integer, required: true
    argument :player_id, Integer, required: true

    type Types::ShotType

    def resolve(club_id: nil, rating: nil, player_id: nil)
      Shot.create!(
        player_id: player_id,
        club_id: club_id,
        rating: rating
      )
    end
  end
end
