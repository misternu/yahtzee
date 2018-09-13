require 'spec_helper'
require_relative '../category'
require_relative '../die'

describe Category do
  describe '#initialize' do
    let(:category) { Category.new(:foobar) }
    it 'has an initial score of nil' do
      expect(category.score).to be nil
    end
  end
  describe '#score' do
    let(:dice) { Array.new(5) { Die.new(1) } }
    let(:bad_dice) { Array.new(4) { Die.new(1) } << Die.new(2) }
    let(:category) { Category.new(:yahtzee) }
    it 'has a score of 50 if it is yahtzee and that is its type' do
      category.score_dice(dice)
      expect(category.score).to eq 50
    end
    it 'has a score of 0 if it is not yahtzee and should be' do
      category.score_dice(bad_dice)
      expect(category.score).to eq 0
    end
  end
end
