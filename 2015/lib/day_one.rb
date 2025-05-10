# Advent of code 2015 day 01
# ( go up one floor
# ) go down one floor

# Day One
class DayOne
  attr_accessor :floor

  def initialize
    @floor = 0
  end

  def up_floor
    @floor += 1
  end

  def down_floor
    @floor -= 1
  end

  def get_floor(directions)
    directions.chomp.split('').each do |d|
      if d == '('
        up_floor
      elsif d == ')'
        down_floor
      else
        next
      end
    end

    floor
  end
end
