def read_input(filename)
  file_path = File.expand_path(filename, File.dirname(__FILE__) + "/resources")
  File.read(file_path).split(",").map(&:to_i)
end

def read_input_p2(filename)
  file_path = File.expand_path(filename, File.dirname(__FILE__) + "/resources")

  fish_map = get_empty_fish_map

  File.read(file_path).split(",").each do |fish_timer|
    fish_map[fish_timer.to_i] += 1
  end

  fish_map
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

def get_fish_p2(initial_fish, days)
  fish_map = initial_fish.dup

  days.times.each do |_|
    birthing = fish_map.shift
    fish_map[6] += birthing
    fish_map.push(birthing)
  end

  fish_map
end

def get_empty_fish_map
  Array.new(9, 0)
end