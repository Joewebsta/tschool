class Ferret
  attr_accessor :name

  def initialize
    @name = nil
  end

  def give_name(name)
    self.name = name
  end
end