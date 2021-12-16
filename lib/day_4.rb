# frozen_string_literal: true

# require_relative "advent_of_code_2021/version"

class Day4
  ROW_LENGTH = 5
  BOARD_LENGTH = 5

  def load_input(input_file)
    @input_file = input_file
    file_data = File.read(File.expand_path(input_file, File.dirname(__FILE__))).split

    @drawings = file_data.shift.split(',').map { |s| s.to_i }

    @boards = []
    while file_data.size > 0 do
      new_board = []

      (1..BOARD_LENGTH).each {
        new_board.push(file_data.shift(ROW_LENGTH).map { |s| s.to_i })
      }

      @boards.push(new_board)
    end
  end

  def answer
    picked = []
    answer = 0
    @drawings.each do |drawing|
      # puts "drawing: #{drawing}"
      picked.push(drawing)
      # puts "picked: #{picked}"
      @boards.each do |board|
        did_bingo = did_win(board, picked.length)
        if did_bingo
          answer = score_board(board, picked.length)
          puts "answer: #{answer} - board: #{board}"
          break
        end
      end

      if answer > 0
        break
      end
    end
    answer
  end

  def drawings
    @drawings
  end

  def boards
    @boards
  end

  def did_win(board, draw_number)
    picked = @drawings.take(draw_number)
    is_bingo = false
    (0..4).each do |i|
      row = board[i]
      column = board.map { |bRow| bRow[i] }

      row_complete = row.all? { |num| picked.include?(num) }
      column_complete = column.all? { |num| picked.include?(num) }

      (is_bingo = true) && break if row_complete || column_complete
    end

    is_bingo
  end

  def score_board(board, draw_number)
    picked = @drawings.take(draw_number)
    sum = board.flatten(2).select { |num| !picked.include?(num) }.sum

    sum * picked.last
  end

end
