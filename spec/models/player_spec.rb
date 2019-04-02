require 'rails_helper'

RSpec.describe Player, type: :model do
  describe('relationships') do
    it{ should have_many(:player_stats)}
    it{ should have_many(:player_clubs)}
    it{ should have_many(:clubs).through(:player_clubs)}
  end
end
