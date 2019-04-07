module Types
  class PlayerStatType < BaseObject
    field :player_id, Integer, null: false
    field :hook_percentage, Float, null: false
    field :pull_percentage, Float, null: false
    field :great_shot_percentage, Float, null: false
    field :push_percentage, Float, null: false
    field :slice_percentage, Float, null: false
    field :duff_percentage, Float, null: false
  end
end
