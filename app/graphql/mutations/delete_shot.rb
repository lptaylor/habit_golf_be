module Mutations
  class DeleteShot < BaseMutation
    argument :id, Integer, required: true

    type Types::ShotType

    def resolve(args)
      shot = Shot.find(args[:id])
      shot.destroy!
      shot
    end
  end
end
