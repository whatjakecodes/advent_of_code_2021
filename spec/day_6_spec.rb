# frozen_string_literal: true
require 'day_6'

RSpec.describe 'Day 6' do
  describe "part 1" do
    it 'should answer sample' do
      initial_fish = read_input('day6_sample.txt')
      expect(initial_fish).to eq([3,4,3,1,2])
      expect(get_fish(initial_fish, 18).size).to eq(26)
      expect(get_fish(initial_fish, 80).size).to eq(5934)
    end

    it 'should answer my input' do
      initial_fish = read_input('day6.txt')
      expect(get_fish(initial_fish, 80).size).to eq(375482)
    end

    it 'should handle 1 fish' do
      expect(get_fish([0], 0)).to eq([0])
      expect(get_fish([0], 1)).to eq([6,8])
    end
  end
end