# a score category in Yahtzee
class Category
  attr_reader :type, :score
  def initialize(type)
    @type = type
    @score = nil
  end

  def score_dice(dice)
    return false unless dice.length == 5
    case type
    when :yahtzee
      @score = yahtzee?(dice) ? 50 : 0
    end
  end

  def yahtzee?(dice)
    dice.map(&:value).uniq.count == 1
  end
end
