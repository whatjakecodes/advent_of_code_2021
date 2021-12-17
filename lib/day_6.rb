def read_input(filename)
  file_path = File.expand_path(filename, File.dirname(__FILE__) + "/resources")
  File.read(file_path).split(",").map(&:to_i)
end

def get_fish(initial_fish, days)
  fishies = initial_fish.dup

  days.times.each do |day|

    (0..(fishies.size - 1)).each do |i|

      case fishies[i]
      when 0
        fishies[i] = 6
        fishies.push(8)
      else
        fishies[i] -= 1
      end
    end

  end

  fishies
end