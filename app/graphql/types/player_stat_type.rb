module Types
  class PlayerStatType < BaseObject
    field :player_id, Integer, null: true
    field :hook_percentage, Float, null: true
    field :pull_percentage, Float, null: true
    field :great_shot_percentage, Float, null: true
    field :push_percentage, Float, null: true
    field :slice_percentage, Float, null: true
    field :duff_percentage, Float, null: true
    field :today_hook_percentage, Float, null: true
    field :today_pull_percentage, Float, null: true
    field :today_great_shot_percentage, Float, null: true
    field :today_push_percentage, Float, null: true
    field :today_slice_percentage, Float, null: true
    field :today_duff_percentage, Float, null: true
  end
end
