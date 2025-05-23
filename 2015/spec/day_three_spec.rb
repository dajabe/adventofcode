# For example:
#
# > delivers presents to 2 houses: one at the starting location, and one to the east.
# ^>v< delivers presents to 4 houses in a square, including twice to the house at his starting/ending location.
# ^v^v^v^v^v delivers a bunch of presents to some very lucky children at only 2 houses.
require 'day_three'

RSpec.describe DayThree, 'Provides answers to DayThree problems correctly' do
  before(:each) do
    @daythree = DayThree.new
  end
  context 'Calculate the correct amount of paper for the elves' do
    it '> delivers presents to 2 houses' do
      @daythree.deliver_presents('>')
      expect(@daythree.unique_houses).to eq(2)
    end
    it '^>v< delivers presents to 4 houses in a square' do
      @daythree.deliver_presents('^>v<')
      expect(@daythree.unique_houses).to eq(4)
    end
    it '^v^v^v^v^v delivers a bunch of presents to some very lucky children at only 2 houses' do
      @daythree.deliver_presents('^v^v^v^v^v')
      expect(@daythree.unique_houses).to eq(2)
    end
    it 'gives the day three part one answer' do
      input = File.read('input/day_three_input.txt')
      @daythree.directions = input
      @daythree.read_directions
      answer = @daythree.unique_houses
      report_answer(answer)
    end
  end
  context 'Records present deliveries' do
    it '^v delivers presents to 3 houses, because Santa goes north, and then Robo-Santa goes south.' do
      @daythree.deliver_presents('^v', robo_helper: true)
      expect(@daythree.unique_houses).to eq(3)
    end
    it '^>v< now delivers presents to 3 houses, and Santa and Robo-Santa end up back where they started.' do
      @daythree.deliver_presents('^>v<', robo_helper: true)
      expect(@daythree.unique_houses).to eq(3)
    end
    it '^v^v^v^v^v now delivers presents to 11 houses, with Santa going one direction and Robo-Santa going the other' do
      @daythree.deliver_presents('^v^v^v^v^v', robo_helper: true)
      expect(@daythree.unique_houses).to eq(11)
    end
    it 'gives the day three part two answer' do
      input = File.read('input/day_three_input.txt')
      @daythree.deliver_presents(input, robo_helper: true)
      answer = @daythree.unique_houses
      report_answer(answer)
    end
  end
end
