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

    it '#stats' do
      player = Player.create(name: "Happy Gilmore", email: "happy@gmail.com", password: "password")
      club = Club.create(style_of_club: 1)
      club.shots.create(rating: 1, player_id: player.id)
      club.shots.create(rating: 2, player_id: player.id)
      club.shots.create(rating: 3, player_id: player.id)
      club.shots.create(rating: 4, player_id: player.id)
      club.shots.create(rating: 5, player_id: player.id)
      club.shots.create(rating: 6, player_id: player.id)
      hook = PlayerStat.stats(1, player.id)
      pull = PlayerStat.stats(2, player.id)
      great = PlayerStat.stats(3, player.id)
      push = PlayerStat.stats(4, player.id)
      slice = PlayerStat.stats(5, player.id)
      duff = PlayerStat.stats(6, player.id)

      expect(hook).to eq(17)
      expect(pull).to eq(17)
      expect(great).to eq(17)
      expect(push).to eq(17)
      expect(slice).to eq(17)
      expect(duff).to eq(17)
    end
  end
end
