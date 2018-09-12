# class to represent individual die
class Die
  attr_reader :value
  def initialize(value = nil)
    @value = value
  end

  def roll
    @value = rand(6) + 1
  end
end
