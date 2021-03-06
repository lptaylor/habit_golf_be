require 'rails_helper'

RSpec.describe Shot, type: :model do
  describe('relationships') do
    it { should belong_to(:club)}
    it { should belong_to(:player)}
  end
end
