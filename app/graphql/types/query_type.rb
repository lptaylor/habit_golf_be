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
