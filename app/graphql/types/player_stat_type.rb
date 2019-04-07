module Types
  class PlayerStatType < BaseObject
    field :player_id, Integer, null: false
    field :hook_percentage, Float, null: false
    field :pull_percentage, Float, null: false
    field :great_shot_percentage, Float, null: false
    field :push_percentage, Float, null: false
    field :slice_percentage, Float, null: false
    field :duff_percentage, Float, null: false
    field :today_hook_percentage, Float, null: false
    field :today_pull_percentage, Float, null: false
    field :today_great_shot_percentage, Float, null: false
    field :today_push_percentage, Float, null: false
    field :today_slice_percentage, Float, null: false
    field :today_duff_percentage, Float, null: false
    field :week_hook_percentage, Float, null: false
    field :week_pull_percentage, Float, null: false
    field :week_great_shot_percentage, Float, null: false
    field :week_push_percentage, Float, null: false
    field :week_slice_percentage, Float, null: false
    field :week_duff_percentage, Float, null: false
  end
end
