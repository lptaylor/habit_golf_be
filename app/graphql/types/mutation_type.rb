module Types
  class MutationType < Types::BaseObject
    field :create_player, mutation: Mutations::CreatePlayer
    field :create_shot, mutation: Mutations::CreateShot
  end
end
