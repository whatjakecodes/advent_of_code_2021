# frozen_string_literal: true

RSpec.describe AdventOfCode2021 do
  it "has a version number" do
    expect(AdventOfCode2021::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(AdventOfCode2021::Day4.day4?).to eq("hello world")
  end
end
