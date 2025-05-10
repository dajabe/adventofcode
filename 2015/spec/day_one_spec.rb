require 'day_one'

RSpec.describe DayOne, 'Provides answers to DayOne problems correctly' do
  context 'Present delivery to the correct floor' do
    before(:each) do
      @dayone = DayOne.new
    end

    it 'moves up one floor' do
      @dayone.up_floor
      expect(@dayone.floor).to eq 1
    end

    it 'moves down one floor' do
      @dayone.down_floor
      expect(@dayone.floor).to eq(-1)
    end

    it '(()) returns the correct floor' do
      @dayone.directions = '(())'
      @dayone.find_floor
      expect(@dayone.floor).to eq 0
    end

    it '()() returns the correct floor' do
      @dayone.directions = '()()'
      @dayone.find_floor
      expect(@dayone.floor).to eq 0
    end

    it '((( returns the correct floor' do
      @dayone.directions = '((('
      @dayone.find_floor
      expect(@dayone.floor).to eq 3
    end

    it '(()(()( returns the correct floor' do
      @dayone.directions = '(()(()('
      @dayone.find_floor
      expect(@dayone.floor).to eq 3
    end

    it '))((((( returns the correct floor' do
      @dayone.directions = '(()(()('
      @dayone.find_floor
      expect(@dayone.floor).to eq 3
    end

    it '()) returns the correct floor' do
      @dayone.directions = '())'
      @dayone.find_floor
      expect(@dayone.floor).to eq(-1)
    end

    it '))( returns the correct floor' do
      @dayone.directions = '))('
      @dayone.find_floor
      expect(@dayone.floor).to eq(-1)
    end

    it '))) returns the correct floor' do
      @dayone.directions = ')))'
      @dayone.find_floor
      expect(@dayone.floor).to eq(-3)
    end

    it ')())()) returns the correct floor' do
      @dayone.directions = ')())())'
      @dayone.find_floor
      expect(@dayone.floor).to eq(-3)
    end

    it 'gives the day one part one answer' do
      input = File.read('input/day_one_input.txt')
      @dayone.directions = input
      @dayone.find_floor
      answer = @dayone.floor
      report_answer(answer)
    end

    it ') returns position 1' do
      @dayone.directions = ')'
      @dayone.find_floor
      expect(@dayone.basement_found).to eq(1)
    end

    it '()()) returns position 1' do
      @dayone.directions = '()())'
      @dayone.find_floor
      expect(@dayone.basement_found).to eq(5)
    end

    it 'gives the day one part two answer' do
      input = File.read('input/day_one_input.txt')
      @dayone.directions = input
      @dayone.find_floor
      answer = @dayone.basement_found
      report_answer(answer)
    end
  end
end
