# Advent of code 2015 day 01
# ( go up one floor
# ) go down one floor

# Day One
class DayOne
  attr_accessor :floor, :basement_found
  attr_reader :directions

  def directions=(input)
    @directions = input.to_s.chomp.chars
  end

  def initialize
    @floor = 0
    @basement_found = nil
  end

  def up_floor
    @floor += 1
  end

  def down_floor
    @floor -= 1
  end

  def find_floor
    @directions.each_with_index do |d, i|
      if d == '('
        up_floor
      elsif d == ')'
        down_floor
        @basement_found = i + 1 if @floor == -1 && @basement_found.nil?
      else
        next
      end
    end

    floor
  end
end
