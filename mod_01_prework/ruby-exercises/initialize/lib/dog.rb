class Dog
  attr_accessor :name, :breed

  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  def greeting
    "Woof, I'm #{self.name} the #{self.breed}!"
  end
end