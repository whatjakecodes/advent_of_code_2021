# frozen_string_literal: true
require 'day_7'

RSpec.describe 'Day 7' do
  describe "part 1" do
    it 'should read sample input' do
      expect(read_input_d7('day7_sample.txt')).to eq([16,1,2,0,4,2,7,1,2,14])
    end

    it 'should get_grid' do
      expect(get_grid([0])).to eq([1])
      expect(get_grid([1])).to eq([0, 1])
      expect(get_grid([0,1])).to eq([1, 1])
      expect(get_grid([1,0])).to eq([1, 1])
      expect(get_grid([5])).to eq([0,0,0,0,0,1])
      expect(get_grid([5,5])).to eq([0,0,0,0,0,2])
      expect(get_grid([5,4,3])).to eq([0,0,0,1,1,1])
    end

    it 'should calculate gas_required' do
      expect(gas_required([1,0,0], 2)).to eq(2)
      expect(gas_required([2,0,0], 2)).to eq(4)
      expect(gas_required([3,0,0], 2)).to eq(6)

      expect(gas_required([1,1,1], 1)).to eq(2)
      expect(gas_required([0,10,0], 1)).to eq(0)
    end

    it 'should calculate gas for sample positions' do
      input = read_input_d7('day7_sample.txt')
      grid = get_grid(input)
      expect(gas_required(grid, 2)).to eq(37)
      expect(gas_required(grid, 1)).to eq(41)
      expect(gas_required(grid, 3)).to eq(39)
      expect(gas_required(grid, 10)).to eq(71)
    end

    it 'should find smallest gas required for sample' do
      input = read_input_d7('day7_sample.txt')
      grid = get_grid(input)
      expect(find_minimum_gas(grid, 0, grid.size-1)).to eq(37)
    end

    it 'should find smallest gas required' do
      expect(find_minimum_gas([0], 0, 0)).to eq(0)
      expect(find_minimum_gas([0,1], 0, 1)).to eq(0)
      expect(find_minimum_gas([0,1,1], 0, 2)).to eq(1)
      expect(find_minimum_gas([1,1,1], 0, 2)).to eq(2)
      expect(find_minimum_gas([0,1,2,0,0,0], 0, 5)).to eq(1)
    end

    it 'should find smallest gas required for my input' do
      input = read_input_d7('day7.txt')
      grid = get_grid(input)
      expect(find_minimum_gas(grid, 0, grid.size-1)).to eq(353800)
    end

  end

end