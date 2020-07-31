class Vampire
  attr_accessor :name, :pet, :thirsty

  def initialize(name, pet = 'bat')
    @name = name
    @pet = pet
    @thirsty = true
  end

  def thirsty?
    thirsty
  end

  def drink
    self.thirsty = false
  end
end
