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
      @dayone.get_floor('(())')
      expect(@dayone.floor).to eq 0
    end

    it '()() returns the correct floor' do
      @dayone.get_floor('()()')
      expect(@dayone.floor).to eq 0
    end

    it '((( returns the correct floor' do
      @dayone.get_floor('(((')
      expect(@dayone.floor).to eq 3
    end

    it '(()(()( returns the correct floor' do
      @dayone.get_floor('(()(()(')
      expect(@dayone.floor).to eq 3
    end

    it '))((((( returns the correct floor' do
      @dayone.get_floor('(()(()(')
      expect(@dayone.floor).to eq 3
    end

    it '()) returns the correct floor' do
      @dayone.get_floor('())')
      expect(@dayone.floor).to eq(-1)
    end

    it '))( returns the correct floor' do
      @dayone.get_floor('))(')
      expect(@dayone.floor).to eq(-1)
    end

    it '))) returns the correct floor' do
      @dayone.get_floor(')))')
      expect(@dayone.floor).to eq(-3)
    end

    it ')())()) returns the correct floor' do
      @dayone.get_floor(')())())')
      expect(@dayone.floor).to eq(-3)
    end
  end
end
