# class to represent a round of Yahtzee
class Round
  attr_reader :dice, :rolls
  def initialize
    @dice = Array.new(5) { Die.new }
    @rolls = 0
  end

  def roll(hold = [])
    @dice.each_with_index do |die, index|
      die.roll unless hold.include?(index)
    end
    @rolls += 1
  end
end
