# Advent of code 2015
#
## Examples
# > delivers presents to 2 houses: one at the starting location, and one to the east.
#
# ^>v< delivers presents to 4 houses in a square, including twice to the house at his starting/ending location.
#
# ^v^v^v^v^v delivers a bunch of presents to some very lucky children at only 2 houses.
#
# Day Three
class DayThree
  attr_accessor :santa, :visited_houses, :robo_santa
  attr_reader :directions

  def directions=(input)
    @directions = input.to_s.chomp.split('')
  end

  def initialize
    @visited_houses = []
    @santa = { x: 0, y: 0 }
    @robo_santa = { x: 0, y: 0 }
    record_house
    record_house(@robo_santa)
  end

  def deliver_presents(input, robo_helper: false)
    self.directions = input
    read_directions(robo_helper: robo_helper)
  end

  def record_house(driver = @santa)
    @visited_houses.append(driver.dup)
  end

  def unique_houses
    @visited_houses.uniq { |house| [house[:x], house[:y]] }.length
  end

  def read_directions(robo_helper: false)
    @directions.each_with_index do |direction, i|
      if i.even? && robo_helper
        move_sleigh(direction, @robo_santa)
      else
        move_sleigh(direction, @santa)
      end
    end
  end

  def move_sleigh(direction, delivery_driver)
    case direction
    when '^'
      delivery_driver[:y] += 1
    when '>'
      delivery_driver[:x] += 1
    when '<'
      delivery_driver[:x] -= 1
    when 'v'
      delivery_driver[:y] -= 1
    else
      puts "Help something borken, wtf is #{direction}"
    end
    record_house(delivery_driver)
  end
end
