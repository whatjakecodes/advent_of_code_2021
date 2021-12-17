def read_input(filename)
  file_path = File.expand_path(filename, File.dirname(__FILE__) + "/resources")

  grid = [
    [0, 0],
    [0, 0]
  ]
  File.readlines(file_path).map(&:chomp).each do |line|
    coords = line.split(" -> ")
    point1 = coords[0].split(",").map { |n| n.to_i }
    point2 = coords[1].split(",").map { |n| n.to_i }

    x1 = point1[0]
    y1 = point1[1]

    x2 = point2[0]
    y2 = point2[1]

    grid = expand_grid(grid, x1, y1)
    grid = expand_grid(grid, x2, y2)

    if x1 == x2
      # is vertical line
      min_y = [y1,y2].min
      max_y = [y1,y2].max
      (min_y..max_y).each do |y|
        grid[y][x1] += 1
      end
    end

    if y1 == y2
      # is horizontal line
      min_x = [x1,x2].min
      max_x = [x1,x2].max
      (min_x..max_x).each do |x|
        grid[y1][x] += 1
      end
    end
  end

  grid
end

def expand_grid(grid, x, y)
  missing_rows = y - grid.size

  current_column_count = grid[0].nil? ? 0 : grid[0].size
  desired_column_count = [x + 1, current_column_count].max

  (0..missing_rows).each do |i|
    grid.push(Array.new(desired_column_count, 0))
  end

  grid.each do |row|
    missing_columns = desired_column_count - row.size - 1
    (0..missing_columns).each { |_| row.push(0) }
  end

  grid
end

def count_intersections(grid)
  grid.flatten(1).count {|value| value > 1}
end