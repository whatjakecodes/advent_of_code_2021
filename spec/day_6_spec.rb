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

  describe "part 2" do
    it 'should parse data into hash' do
      initial_fish = read_input_p2('day6_sample.txt')
      expected = [0,1,1,2,1,0,0,0,0]
      expect(initial_fish).to eq(expected)
    end

    it 'should answer sample' do
      initial_fish = read_input_p2('day6_sample.txt')
      expect(get_fish_p2(initial_fish, 18).sum).to eq(26)
      expect(get_fish_p2(initial_fish, 80).sum).to eq(5934)
      expect(get_fish_p2(initial_fish, 256).sum).to eq(26984457539)
    end

    it 'should answer my input' do
      initial_fish = read_input_p2('day6.txt')
      expect(get_fish_p2(initial_fish, 256).sum).to eq(1689540415957)
    end

    it 'should handle 1 fish' do
      fish_map = get_empty_fish_map
      fish_map[0] = 1

      expect(get_fish_p2(fish_map, 0)).to eq([1,0,0,0,0,0,0,0,0])
      expect(get_fish_p2(fish_map, 1)).to eq([0,0,0,0,0,0,1,0,1])
    end
  end
end