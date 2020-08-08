class Hobbit
  attr_reader :name, :disposition, :ring, :short
  attr_accessor :age

  def initialize(name, disposition = 'homebody', ring = false)
    @name = name
    @disposition = disposition
    @ring = ring
    @age = 0
    @short = true
  end

  def celebrate_birthday
    self.age += 1
  end

  def adult?
    age > 32
  end

  def old?
    age > 100
  end

  def ring?
    ring
  end

  def short?
    short
  end
end
