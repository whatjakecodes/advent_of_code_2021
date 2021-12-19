# frozen_string_literal: true
require 'day_8'

RSpec.describe 'Day 8' do
  describe "part 1" do
    it 'should read small sample input' do
      data = read_input_d8('day8_small_sample.txt')
      expect(data.size).to eq(1)
      expect(data[0][:signals]).to eq(%w[acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab])
      expect(data[0][:outputs]).to eq(%w[cdfeb fcadb cdfeb cdbaf])

      actual = count_simple_digits(data)
      expect(actual).to eq(0)
    end

    it 'should read sample input' do
      data = read_input_d8('day8_sample.txt')
      expect(data.size).to eq(10)
      expect(data[0][:signals]).to eq(%w[be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb])
      expect(data[0][:outputs]).to eq(%w[fdgacbe cefdb cefbgd gcbe])

      actual = count_simple_digits(data)
      expect(actual).to eq(26)
    end

    it 'should read my input' do
      data = read_input_d8('day8.txt')
      actual = count_simple_digits(data)
      expect(actual).to eq(387)
    end
  end

  describe "part 2" do
    it 'should decode small sample input' do
      data = read_input_d8('day8_small_sample.txt')
      expect(data.size).to eq(1)
      expect(data[0][:signals]).to eq(%w[acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab])
      expect(data[0][:outputs]).to eq(%w[cdfeb fcadb cdfeb cdbaf])

      decode_wire_map(data)
      expect(data[0][:wire_map]).to eq({
                                         'a': %w[d],
                                         'bd': %w[e f],
                                         'cf': %w[a b],
                                         'eg': %w[c g]
                                       })

      decode_number_map(data)
      expect(data[0][:number_map]).to eq({
                                   "8": %w[a b c d e f g],
                                   "5": %w[c d f b e],
                                   "2": %w[g c d f a],
                                   "3": %w[f b c a d],
                                   "7": %w[d a b],
                                   "9": %w[c e f a b d],
                                   "6": %w[c d f g e b],
                                   "4": %w[a b e f],
                                   "0": %w[c a g e d b],
                                   "1": %w[a b],
                                 })

      expect(decode_output(data)).to eq(5353)
    end

    it 'should decode sample input' do
      data = read_input_d8('day8_sample.txt')
      expect(data.size).to eq(10)
      decode_wire_map(data)
      expect(data[0][:wire_map].size).to eq(4)

      decode_number_map(data)
      expect(data[0][:number_map].size).to eq(10)

      expect(decode_output(data)).to eq(61229)
    end

    it 'should decode my input' do
      data = read_input_d8('day8.txt')
      decode_wire_map(data)
      decode_number_map(data)
      expect(decode_output(data)).to eq(986034)
    end

  end

end