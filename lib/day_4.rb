# frozen_string_literal: true

# require_relative "advent_of_code_2021/version"

class Day4
  ROW_LENGTH = 5
  BOARD_LENGTH = 5

  def load_input(input_file)
    @input_file = input_file
    file_data = File.read(File.expand_path(input_file, File.dirname(__FILE__))).split

    @drawings = file_data.shift.split(',').map{|s| s.to_i}

    @boards = []
    while file_data.size > 0 do
      new_board = []

      (1..BOARD_LENGTH).each {
        new_board.push(file_data.shift(ROW_LENGTH).map { |s| s.to_i })
      }

      @boards.push(new_board)
    end
  end

  def drawings
    @drawings
  end

  def boards
    @boards
  end

  def answer
    "hello world"
  end
end
