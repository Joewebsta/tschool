class Werewolf
  attr_reader :name, :location, :victims
  attr_accessor :human, :wolf, :hungry

  def initialize(name, location = 'London')
    @name = name
    @location = location
    @human = true
    @wolf = false
    @hungry = false
    @victims = []
  end

  def human?
    human
  end

  def wolf?
    wolf
  end

  def change!
    self.human = (human? ? false : true)
    self.wolf = (wolf? ? false : true)
    self.hungry = true
  end

  def hungry?
    hungry
  end

  def consume(victim)
    return victims if human?

    victims << victim
    victim.status = :dead
    self.hungry = false
  end
end

class Victim
  attr_reader :status

  def initialize
    @status = :alive
  end
end
