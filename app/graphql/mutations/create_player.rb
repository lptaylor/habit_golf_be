module Mutations
  class CreatePlayer < BaseMutation

    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    type Types::PlayerType

    def resolve(name: nil, email: nil, password: nil)
      Player.create!(
        name: name,
        email: email,
        password: password
      )
    end
  end
end
