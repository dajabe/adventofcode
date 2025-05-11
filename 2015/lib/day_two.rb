# Advent of code 2015
#
# Area of each present
# 2*l*w + 2*w*h + 2*h*l
#
# Plus area of the smallest side to calculate total wrapping paper
#
# A present with dimensions 2x3x4 requires 2*6 + 2*12 + 2*8 = 52 square feet
# of wrapping paper plus 6 square feet of slack, for a total of 58 square feet.
#
# A present with dimensions 1x1x10 requires 2*1 + 2*10 + 2*10 = 42 square feet
# of wrapping paper plus 1 square foot of slack, for a total of 43 square feet.
#
# Part 2 hints
# A present with dimensions 2x3x4 requires 2+2+3+3 = 10 feet of ribbon to wrap
# the present plus 2*3*4 = 24 feet of ribbon for the bow, for a total of 34 feet.
#
# A present with dimensions 1x1x10 requires 1+1+1+1 = 4 feet of ribbon to wrap
# the present plus 1*1*10 = 10 feet of ribbon for the bow, for a total of 14 feet.#
#
# Day Two
class DayTwo
  attr_accessor :total_paper, :total_ribbon
  attr_reader :present_dimensions

  def present_dimensions=(input)
    @present_dimensions = input.split("\n").map { |d| d.split('x').map(&:to_i) }
    calculate_resources
  end

  def increment_ribbon(amount)
    @total_ribbon += amount
  end

  def initialize
    @total_paper = 0
    @total_ribbon = 0
  end

  def calculate_sides(dimensions)
    # l / w / h
    [
      dimensions[0] * dimensions[1],
      dimensions[1] * dimensions[2],
      dimensions[2] * dimensions[0]
    ]
  end

  def calculate_resources
    paper_required = @present_dimensions.map do |dimensions|
      calculate_ribbon(dimensions)
      sides = calculate_sides(dimensions)
      sides.reduce(sides.min) { |total, side_area| total + 2 * side_area }
    end

    @total_paper = paper_required.sum
  end

  def calculate_ribbon(dimensions)
    diameter = dimensions.min(2).sum * 2
    volume = dimensions.reduce(1, :*)
    increment_ribbon(volume + diameter)
  end
end
