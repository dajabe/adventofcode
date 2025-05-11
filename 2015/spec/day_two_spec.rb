require 'day_two'

RSpec.describe DayTwo, 'Provides answers to DayTwo problems correctly' do
  before(:each) do
    @daytwo = DayTwo.new
  end
  context 'Calculate the correct amount of paper for the elves' do
    it 'stores the dimensions correctly' do
      @daytwo.present_dimensions = "2x3x4\n2x3x4"

      expect(@daytwo.present_dimensions).to eq([[2, 3, 4], [2, 3, 4]])
    end

    it 'calculates sides of 2x3x4' do
      sides = @daytwo.calculate_sides([2, 3, 4])
      expect(sides).to eq([6, 12, 8])
    end

    it '2x3x4 requires 58 square feet' do
      @daytwo.present_dimensions = '2x3x4'
      expect(@daytwo.total_paper).to eq(58)
    end

    it '1x1x10 requires 43 square feet' do
      @daytwo.present_dimensions = '1x1x10'
      expect(@daytwo.total_paper).to eq(43)
    end

    it 'gives the day two part one answer' do
      input = File.read('input/day_two_input.txt')
      @daytwo.present_dimensions = input
      answer = @daytwo.total_paper
      report_answer(answer)
    end
  end
  context 'Calculate the correct amount of ribbon for the elves' do
    it 'calculates 34 feet of ribbon for a 2x3x4 present' do
      @daytwo.present_dimensions = '2x3x4'
      expect(@daytwo.total_ribbon).to eq(34)
    end
    it 'calculates 14 feet of ribbon for a 1x1x10 present' do
      @daytwo.present_dimensions = '1x1x10'
      expect(@daytwo.total_ribbon).to eq(14)
    end
    it 'how much ribbon do the elves need?' do
      input = File.read('input/day_two_input.txt')
      @daytwo.present_dimensions = input
      answer = @daytwo.total_ribbon
      report_answer(answer)
    end
  end
end
