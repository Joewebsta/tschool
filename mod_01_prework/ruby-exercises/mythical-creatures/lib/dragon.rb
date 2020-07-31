class Dragon
  attr_accessor :name, :color, :rider, :hungry_level

  def initialize(name, color, rider)
    @name = name
    @color = color
    @rider = rider
    @hungry_level = 3
  end

  def hungry?
    hungry_level.positive?
  end

  def eat
    self.hungry_level -= 1
  end
end
