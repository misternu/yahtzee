# class to represent individual die
class Die
  attr_reader :value
  def initialize(value = nil)
    @value = value
  end

  def roll
    @value = (1..6).to_a.sample
  end
end
