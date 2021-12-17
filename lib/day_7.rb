def read_input_d7(filename)
  file_path = File.expand_path(filename, File.dirname(__FILE__) + "/resources")
  File.read(file_path).split(",").map(&:to_i)
end

def get_grid(positions)
  grid = Array.new(positions.max + 1, 0)
  positions.each do |pos|
    grid[pos] += 1
  end
  grid
end

def gas_required(grid, to_position)
  gas_total = 0
  (0..grid.size - 1).each do |pos|
    crabs_at_pos = grid[pos]
    gas_required = (to_position - pos).abs
    gas_total += gas_required * crabs_at_pos
  end

  gas_total
end

def find_minimum_gas(grid, from = 0, to = nil)
  to = grid.size - 1 if to.nil?

  if to == from
    return gas_required(grid, from)
  end

  length = 1 + to - from
  middle = from + (length / 2).floor
  middle_right = middle + (length / 4.floor)
  middle_left = middle - (length / 4.floor)

  gas_right = gas_required(grid, middle_right)
  gas_left = gas_required(grid, middle_left)

  if gas_right > gas_left
    next_left_min = find_minimum_gas(grid, from, middle)
    [gas_left, next_left_min].min
  else
    next_right_min = find_minimum_gas(grid, middle, to)
    [gas_right, next_right_min].min
  end
end