# class to represent a round of Yahtzee
class Round
  attr_reader :dice
  def initialize
    @dice = Array.new(5) { Die.new }
  end

  def roll(hold = [])
    @dice.each_with_index do |die, index|
      die.roll unless hold.include?(index)
    end
  end
end
