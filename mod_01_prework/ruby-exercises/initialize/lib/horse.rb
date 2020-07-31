class Horse
  attr_accessor :name, :diet

  def initialize(name)
    @name = name
    @diet = []
  end

  def add_to_diet(food)
    self.diet.push(food)
  end
end