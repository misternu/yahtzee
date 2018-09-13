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
    let(:category_yahtzee) { Category.new(:yahtzee) }
    let(:category_ones) { Category.new(:ones) }
    let(:category_twos) { Category.new(:twos) }
    it 'has a score of 50 if it is yahtzee and that is its type' do
      category_yahtzee.score_dice(dice)
      expect(category_yahtzee.score).to eq 50
    end
    it 'has a score of 0 if it is not yahtzee and should be' do
      category_yahtzee.score_dice(bad_dice)
      expect(category_yahtzee.score).to eq 0
    end
    it 'works for ones with all ones' do
      category_ones.score_dice(dice)
      expect(category_ones.score).to eq 5
    end
    it 'works for ones with four ones' do
      category_ones.score_dice(bad_dice)
      expect(category_ones.score).to eq 4
    end
    it 'works for twos with no twos' do
      category_twos.score_dice(dice)
      expect(category_twos.score).to eq 0
    end
    it 'works for twos with one two' do
      category_twos.score_dice(bad_dice)
      expect(category_twos.score).to eq 2
    end
  end
end
