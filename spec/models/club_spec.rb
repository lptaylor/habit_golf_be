require 'rails_helper'

RSpec.describe Club, type: :model do
  describe('relationships') do
    it { should have_many(:shots) }
    it { should have_many(:player_clubs) }
    it { should have_many(:players).through(:player_clubs) }
  end
end
