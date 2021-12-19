require 'set'

def read_input_d8(filename)
  file_path = File.expand_path(filename, File.dirname(__FILE__) + "/resources")
  data = []
  File.readlines(file_path).map(&:chomp).each do |line|
    input = line.split("|")

    sigs = input[0].split
    vals = input[1].split

    data.push(
      signals: sigs,
      outputs: vals
    )
  end

  data
end

def count_simple_digits(data)
  count = 0

  unique_lengths = [2, 3, 4, 7]

  data.each do |entry|
    entry[:outputs].each do |output|
      if unique_lengths.include?(output.size)
        count += 1
      end
    end
  end

  count
end

def decode_wire_map(data)
  wire_maps = []

  data.each do |segment|
    wire_map = {}

    # find left segments cf via digit 1
    segment[:signals].each do |signal|
      if signal.length == 2
        wire_map[:'cf'] = signal.split('')
      end
    end

    # find 'a' via digit 7 top
    # find 'bd' segments cf via digit 1
    segment[:signals].each do |signal|
      if signal.length == 3
        a_char = signal.split('') - wire_map[:cf]
        wire_map[:'a'] = a_char
      end

      if signal.length == 4
        wire_map[:'bd'] = signal.split('') - wire_map[:cf]
      end
    end

    wire_map[:'eg'] = %w[a b c d e f g] - wire_map[:cf] - wire_map[:bd] - wire_map[:a]

    wire_maps.push(wire_map)
  end

  wire_maps
end

def decode(data, segment_to_wire_maps)
  decoded_maps = []
  i = 0
  data.each do |segment|
    segment_to_wire_map = segment_to_wire_maps[i]
    i += 1

    decoded_map = {
      "0": [],
      "1": segment_to_wire_map[:cf],
      "2": [],
      "3": [],
      "4": segment_to_wire_map[:cf] + segment_to_wire_map[:bd],
      "5": [],
      "6": [],
      "7": segment_to_wire_map[:a] + segment_to_wire_map[:cf],
      "8": %w[a b c d e f g],
      "9": [],
    }

    segment[:signals].each do |signal|
      sig_chars = signal.split('')
      includes_right2 = sig_chars.include?(segment_to_wire_map[:cf][0]) && sig_chars.include?(segment_to_wire_map[:cf][1])
      includes_topleft_mid = sig_chars.include?(segment_to_wire_map[:bd][0]) && sig_chars.include?(segment_to_wire_map[:bd][1])
      includes_botleft_bottom = sig_chars.include?(segment_to_wire_map[:eg][0]) && sig_chars.include?(segment_to_wire_map[:eg][1])

      if sig_chars.size == 6 && includes_right2 && includes_botleft_bottom
        decoded_map[:'0'] = sig_chars
      end

      if sig_chars.size == 5 && includes_botleft_bottom
        decoded_map[:'2'] = sig_chars
      end

      if sig_chars.size == 5 && includes_topleft_mid
        decoded_map[:'5'] = sig_chars
      end

      if sig_chars.size == 5 && includes_right2
        decoded_map[:'3'] = sig_chars
      end

      if sig_chars.size == 6 && includes_topleft_mid && includes_botleft_bottom
        decoded_map[:'6'] = sig_chars
      end

      if sig_chars.size == 6 && includes_topleft_mid && includes_right2
        decoded_map[:'9'] = sig_chars
      end
    end

    decoded_maps.push(decoded_map)
  end

  decoded_maps
end

def decode_output(data, decoded_maps)
  sum = 0
  i = 0

  data.each do |segment|
    number = ''
    output = segment[:outputs]
    decoded_map = decoded_maps[i]
    i += 1

    output.each do |signal|
      signal_set = Set.new(signal.split(''))
      (0..9).each do |num|
        if signal_set == decoded_map[num.to_s.to_sym].to_set
          number += num.to_s
        end
      end

    end

    sum += number.to_i
  end

  sum
end