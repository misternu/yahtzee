require 'spec_helper'
require_relative '../die'

describe Die do
  describe '#initialize' do
    let(:die) { Die.new }
    it 'makes a die with a value of nil' do
      expect(die.value).to be nil
    end
  end
  describe '#roll' do
    let(:die) { Die.new }
    it 'rolls the die and gives it a value between 1 and 6' do
      die.roll
      expect(die.value).to be_an Integer
    end
  end
end
