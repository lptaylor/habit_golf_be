module Types
  class MutationType < Types::BaseObject
    field :create_player, mutation: Mutations::CreatePlayer
  end
end
