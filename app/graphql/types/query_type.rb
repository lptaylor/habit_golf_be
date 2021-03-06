module Types
  class QueryType < Types::BaseObject

    field :players, [PlayerType], null: false do
      argument :ids, [Integer], required: false
    end

    field :shots, [ShotType], null: false do
      argument :ids, [Integer], required: false
      argument :rating, [Integer], required: false
      argument :player_ids, [Integer], required: false
    end

    field :clubs, [ClubType], null: false do
      argument :style_of_club, [Integer], required: false
      argument :ids, [Integer], required: false
    end

    field :player_stats, [PlayerStatType], null: false do
      argument :player_id, Integer, required: true
    end

    def player_stats(**args)
      PlayerStat.where(player_id: args[:player_id])
    end

    def clubs(**args)
      if args[:ids]
        Club.find(args[:ids])
      elsif
        args[:style_of_club]
        Club.where(style_of_club: args[:style_of_club])
      else
        Club.all
      end
    end

    def shots(**args)
      if args[:ids]
        Shot.find(args[:ids])
      elsif
        args[:rating]
        Shot.where(rating: args[:rating])
      elsif
        args[:player_ids]
        Shot.where(player_id: args[:player_ids])
      else
        Shot.all
      end
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
