module Types
  class PlayerType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false

    # IMPORTANT
    #these fields should be removed so as not to be exposed after basic setup they are included only so we can test queries
    field :email, String, null: false
    field :password, String, null: false
  end
end
