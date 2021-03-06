require 'rails_helper'

RSpec.describe PlayerStat, type: :model do
  describe('relationships') do
    it { should belong_to(:player)}
  end

  describe('methods') do
    before(:each) do
      @player = Player.create(id: 100, name: "Happy Gilmore", email: "happy@gmail.com", password: "password")
      @player_2 = Player.create(id: 200, name: "Grizzly Adams", email: "HadABeard@gmail.com", password: "cool")
      @club = Club.create(style_of_club: 1)
      @club.shots.create(rating: 1, player_id: @player.id)
      @club.shots.create(rating: 2, player_id: @player.id)
      @club.shots.create(rating: 3, player_id: @player.id)
      @club.shots.create(rating: 4, player_id: @player.id)
      @club.shots.create(rating: 5, player_id: @player.id)
      @club.shots.create(rating: 6, player_id: @player.id)
      @hook = PlayerStat.stats(1, @player.id)
      @pull = PlayerStat.stats(2, @player.id)
      @great = PlayerStat.stats(3, @player.id)
      @push = PlayerStat.stats(4, @player.id)
      @slice = PlayerStat.stats(5, @player.id)
      @duff = PlayerStat.stats(6, @player.id)
    end

    it '#stats' do
      expect(@hook).to eq(17)
      expect(@pull).to eq(17)
      expect(@great).to eq(17)
      expect(@push).to eq(17)
      expect(@slice).to eq(17)
      expect(@duff).to eq(17)
    end

    it '#today_stats' do
      @club.shots.create(rating: 2, player_id: @player_2.id)
      @club.shots.create(rating: 1, player_id: @player_2.id, created_at: 'Mon, 01 Apr 2019 19:26:49 UTC +00:00')
      @club.shots.create(rating: 3, player_id: @player_2.id)
      @club.shots.create(rating: 4, player_id: @player_2.id)
      @club.shots.create(rating: 5, player_id: @player_2.id)
      @club.shots.create(rating: 6, player_id: @player_2.id)
      hook = PlayerStat.today_stats(1, @player_2.id)
      pull = PlayerStat.today_stats(2, @player_2.id)
      great = PlayerStat.today_stats(3, @player_2.id)
      push = PlayerStat.today_stats(4, @player_2.id)
      slice = PlayerStat.today_stats(5, @player_2.id)
      duff = PlayerStat.today_stats(6, @player_2.id)

      PlayerStat.update_stats(@player_2.id)

      expect(hook).to eq(0)
      expect(pull).to eq(20)
      expect(great).to eq(20)
      expect(push).to eq(20)
      expect(slice).to eq(20)
      expect(duff).to eq(20)

    end

    it '#update_stats' do
      previous = PlayerStat.create(player_id: @player.id, hook_percentage: @hook, pull_percentage: @pull, great_shot_percentage: @great, push_percentage: @push, slice_percentage: @slice, duff_percentage: @duff)
      expect(previous.hook_percentage).to eq(17.0)
      expect(previous.pull_percentage).to eq(17.0)
      expect(previous.great_shot_percentage).to eq(17.0)
      expect(previous.push_percentage).to eq(17.0)
      expect(previous.slice_percentage).to eq(17.0)
      expect(previous.duff_percentage).to eq(17.0)
      @club.shots.create(rating: 1, player_id: @player.id)
      @club.shots.create(rating: 2, player_id: @player.id)

      updated = @player.player_stats.first

      expect(updated.hook_percentage).to eq(25.0)
      expect(updated.pull_percentage).to eq(25.0)
      expect(updated.great_shot_percentage).to eq(13.0)
      expect(updated.push_percentage).to eq(13.0)
      expect(updated.slice_percentage).to eq(13.0)
      expect(updated.duff_percentage).to eq(13.0)
    end
  end
end
