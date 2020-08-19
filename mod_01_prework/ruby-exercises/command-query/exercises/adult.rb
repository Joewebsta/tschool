class Adult
  attr_accessor :consumed_beverages

  def initialize
    @consumed_beverages = 0
  end

  def sober?
    consumed_beverages < 3
  end

  def consume_an_alcoholic_beverage
    self.consumed_beverages += 1
  end
end
