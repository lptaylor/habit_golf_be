module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    # GraphQL::Field.define do
    #   argument :ids, types[types.ID]
    # end

    field :player, [PlayerType], null: false do
      argument :id, Integer, required: true
    end

    field :players, [PlayerType], null: false do
      argument :ids, [Integer], required: false
    end

    field :shots, [ShotType], null: false do
      argument :ids, [Integer], required: false
    end

    field :shot, [ShotType], null: false do
      argument :id, Integer, required: true
    end

    field :clubs, [ClubType], null: false do
      argument :style_of_club, Integer, required: false
    end

    def clubs(**args)
      if args[:style_of_club]
        Club.find(args[:style_of_club])
      else
        Club.all
      end
    end

    def shots(**args)
      if args[:ids]
        Shot.find(args[:ids])
      else
        Shot.all
      end
    end

    def shot(id:)
      Shot.where(id: id)
    end

    def player(id:)
      Player.where(id: id)
    end

    def players(**args)
      if args[:ids]
        Player.find(args[:ids])
      else
        Player.all
      end
    end
  end
end
