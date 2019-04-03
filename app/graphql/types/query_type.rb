module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :all_players, [PlayerType], null: false

    def all_players
      Player.all
    end
  end
end
