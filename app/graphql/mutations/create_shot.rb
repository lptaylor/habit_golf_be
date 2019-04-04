module Mutations
  class CreateShot < BaseMutation

    argument :club_id, Integer, required: true
    argument :rating, Integer, required: true

    type Types::ShotType

    def resolve(club_id: nil, rating: nil )
      Shot.create!(
        club_id: club_id,
        rating: rating
      )
    end
  end
end
