# frozen_string_literal: true
require 'day_5'

RSpec.describe 'Day 5' do
  context "part 1" do
    describe "read_input_day_5" do
      it "should read tiny row input" do
        expected = [
          [0, 0],
          [1, 1]
        ]
        data = read_input_day_5('day5_tiny_row.txt')
        expect(data.size).to eq(2)
        expect(data[0].size).to eq(2)
        expect(data[1].size).to eq(2)
        expect(data).to eq(expected)
      end

      it "should read tiny column input" do
        expected = [
          [0, 1],
          [0, 1]
        ]
        data = read_input_day_5('day5_tiny_column.txt')
        expect(data.size).to eq(2)
        expect(data[0].size).to eq(2)
        expect(data[1].size).to eq(2)
        expect(data).to eq(expected)
      end

      it "should read sample input" do
        expected = [
          [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0, 0, 1, 0, 0],
          [0, 0, 1, 0, 0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
          [0, 1, 1, 2, 1, 1, 1, 2, 1, 1],
          [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          [2, 2, 2, 1, 1, 1, 0, 0, 0, 0]
        ]
        expect(read_input_day_5('day5_sample.txt')).to eq(expected)
      end
    end

    describe "expand_grid" do
      it 'should resize empty grid' do
        expect(expand_grid([[0]], 1, 1)).to eq([
                                                 [0, 0],
                                                 [0, 0]
                                               ])
      end

      it "should resize non-empty grid" do
        expect(expand_grid([[0, 0], [0, 0]], 3, 3)).to eq([
                                                            [0, 0, 0, 0],
                                                            [0, 0, 0, 0],
                                                            [0, 0, 0, 0],
                                                            [0, 0, 0, 0]
                                                          ])
      end
    end

    describe "count_intersections" do
      it "should count no intersections" do
        expect(count_intersections([[0]])).to eq(0)
        expect(count_intersections([[1]])).to eq(0)
        expect(count_intersections([[0, 0], [0, 0]])).to eq(0)
        expect(count_intersections([[1, 1], [1, 1]])).to eq(0)
      end

      it "should count overlapping point" do
        expect(count_intersections([[2]])).to eq(1)
      end

      it "should count intersections" do
        expect(count_intersections([[1, 2], [0, 1]])).to eq(1)
      end
    end

    describe "answer" do
      it 'should calculate sample intersections' do
        grid = read_input_day_5('day5_sample.txt')
        expect(count_intersections(grid)).to eq(5)
      end

      it 'should calculate my intersections' do
        grid = read_input_day_5('day5.txt')
        expect(count_intersections(grid)).to eq(5585)
      end
    end
  end

  context "part 2" do
    describe "add_diagonal_line" do
      it 'should add small diagonal' do
        grid = [
          [0, 0],
          [0, 0]
        ]
        expect(add_diagonal_line(grid, 0, 1, 1, 0)).to eq([
                                                            [0, 1],
                                                            [1, 0]
                                                          ])

        grid = [
          [0, 0],
          [0, 0]
        ]
        expect(add_diagonal_line(grid, 1, 0, 0, 1)).to eq([
                                                            [0, 1],
                                                            [1, 0]
                                                          ])
      end

      it 'should add small negative slope diagonal' do
        grid = [
          [0, 0],
          [0, 0]
        ]
        expect(add_diagonal_line(grid, 0, 0, 1, 1)).to eq([
                                                            [1, 0],
                                                            [0, 1]
                                                          ])
        grid = [
          [0, 0],
          [0, 0]
        ]
        expect(add_diagonal_line(grid, 1, 1, 0, 0)).to eq([
                                                            [1, 0],
                                                            [0, 1]
                                                          ])
      end

      it 'should add large slope diagonals' do
        grid = [
          [0, 0, 0],
          [0, 0, 0],
          [0, 0, 0]
        ]
        grid = add_diagonal_line(grid, 0, 0, 1, 1)
        expect(grid).to eq([
                             [1, 0, 0],
                             [0, 1, 0],
                             [0, 0, 0]
                           ])

        grid = add_diagonal_line(grid, 0, 2, 2, 0)
        expect(grid).to eq([
                             [1, 0, 1],
                             [0, 2, 0],
                             [1, 0, 0]
                           ])

        grid = add_diagonal_line(grid, 2, 2, 1, 1)
        expect(grid).to eq([
                             [1, 0, 1],
                             [0, 3, 0],
                             [1, 0, 1]
                           ])
      end
    end

    it "should read sample input" do
      expected = [
        [1, 0, 1, 0, 0, 0, 0, 1, 1, 0],
        [0, 1, 1, 1, 0, 0, 0, 2, 0, 0],
        [0, 0, 2, 0, 1, 0, 1, 1, 1, 0],
        [0, 0, 0, 1, 0, 2, 0, 2, 0, 0],
        [0, 1, 1, 2, 3, 1, 3, 2, 1, 1],
        [0, 0, 0, 1, 0, 2, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 0, 1, 0, 0, 0],
        [0, 1, 0, 0, 0, 0, 0, 1, 0, 0],
        [1, 0, 0, 0, 0, 0, 0, 0, 1, 0],
        [2, 2, 2, 1, 1, 1, 0, 0, 0, 0],
      ]
      expect(read_input_day_5_p2('day5_sample.txt')).to eq(expected)
    end
    describe "answerP2" do
      it 'should calculate sample intersections' do
        grid = read_input_day_5_p2('day5_sample.txt')
        expect(count_intersections(grid)).to eq(12)
      end

      it 'should calculate my intersections' do
        grid = read_input_day_5_p2('day5.txt')
        expect(count_intersections(grid)).to eq(17193)
      end
    end
  end

end