class Medusa
  attr_reader :name, :statues

  def initialize(name)
    @name = name
    @statues = []
  end

  def stare(victim)
    statues << victim
    victim.stoned = true

    return unless statues.count > 3

    victim = statues.shift
    victim.stoned = false
  end
end

class Person
  attr_reader :name
  attr_accessor :stoned

  def initialize(name)
    @name = name
    @stoned = false
  end

  def stoned?
    stoned
  end
end
