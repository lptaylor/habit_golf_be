require 'rails_helper'

RSpec.describe PlayerStat, type: :model do
  describe('relationships') do
    it { should belong_to(:player)}
  end

  describe('methods') do
    it '#determine_shot_type' do
      shot_type = PlayerStat.determine_shot_type(1)
      expect(shot_type).to eq("hook_percentage")
      shot_type = PlayerStat.determine_shot_type(2)
      expect(shot_type).to eq("pull_percentage")
      shot_type = PlayerStat.determine_shot_type(3)
      expect(shot_type).to eq("great_shot_percentage")
      shot_type = PlayerStat.determine_shot_type(4)
      expect(shot_type).to eq("push_percentage")
      shot_type = PlayerStat.determine_shot_type(5)
      expect(shot_type).to eq("slice_percentage")
      shot_type = PlayerStat.determine_shot_type(6)
      expect(shot_type).to eq("duff_percentage")
    end
  end
end
