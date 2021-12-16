# frozen_string_literal: true
require 'day_4'
RSpec.describe Day4 do

  context 'sample input' do
    before(:context) do
      @day4 = Day4.new
      @day4.load_input('day4_sample.txt')
    end

    it "answers correctly" do
      expect(@day4.answer).to eq(4512)
    end

    it "loads drawings" do
      expect(@day4.drawings).to eq([7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24, 10, 16, 13, 6, 15, 25, 12, 22, 18, 20, 8, 19, 3, 26, 1])
    end

    it "loads boards" do
      board1 = [
        [22, 13, 17, 11, 0],
        [8, 2, 23, 4, 24],
        [21, 9, 14, 16, 7],
        [6, 10, 3, 18, 5],
        [1, 12, 20, 15, 19]
      ]
      board2 = [
        [3, 15, 0, 2, 22],
        [9, 18, 13, 17, 5],
        [19, 8, 7, 25, 23],
        [20, 11, 10, 24, 4],
        [14, 21, 16, 12, 6]
      ]
      board3 = [
        [14, 21, 17, 24, 4],
        [10, 16, 15, 9, 19],
        [18, 8, 23, 26, 20],
        [22, 11, 13, 6, 5],
        [2, 0, 12, 3, 7]
      ]
      expect(@day4.boards[0]).to eq(board1)
      expect(@day4.boards[1]).to eq(board2)
      expect(@day4.boards[2]).to eq(board3)
      expect(@day4.boards.size).to eq(3)
    end

    it 'knows if board bingos' do
      expect(@day4.did_win(@day4.boards[2], 5)).to be_falsey
      expect(@day4.did_win(@day4.boards[2], 11)).to be_falsey
      expect(@day4.did_win(@day4.boards[2], 12)).to be_truthy
    end

    it "scores boards" do
      expect(@day4.score_board(@day4.boards[2], 12)).to eq(188 * 24)
    end

  end

  context 'real input' do
    before(:context) do
      @day4 = Day4.new
      @day4.load_input('day4.txt')
    end

    it "answers correctly" do
      expect(@day4.answer).to eq(0)
    end
  end
end