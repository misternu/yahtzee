# a score category in Yahtzee
class Category
  CATEGORY_TYPES = [
    :yahtzee,
    :ones,
    :twos,
    :threes,
    :fours,
    :fives,
    :sixes
  ]
  attr_reader :type, :score
  def initialize(type)
    return false unless CATEGORY_TYPES.include?(type)
    @type = type
    @score = nil
  end

  def score_dice(dice)
    return false unless dice.length == 5
    self.send(type, dice)
  end

  def yahtzee(dice)
    @score = dice.map(&:value).uniq.count == 1 ? 50 : 0
  end

  def ones(dice)
    number(dice, 1)
  end

  def twos(dice)
    number(dice, 2)
  end

  def threes(dice)
    number(dice, 3)
  end

  def fours(dice)
    number(dice, 4)
  end

  def fives(dice)
    number(dice, 5)
  end

  def sixes(dice)
    number(dice, 6)
  end

  def number(dice, number)
    @score = dice.count { |d| d.value == number } * number
  end
end
