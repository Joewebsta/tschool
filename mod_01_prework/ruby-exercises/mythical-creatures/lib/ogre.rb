class Ogre
  attr_reader :name, :home
  attr_accessor :swings, :encounter_counter

  def initialize(name, home = 'Swamp')
    @name = name
    @home = home
    @swings = 0
    @encounter_counter = 0
  end

  def encounter(human)
    human.encounter_counter += 1
    self.encounter_counter += 1
    swing_at(human) if human.notices_ogre?
    human.knocked_out = true if (swings % 2).zero?
  end

  def swing_at(_target)
    self.swings += 1
  end

  def apologize(human)
    human.knocked_out = false
  end
end

class Human
  attr_reader :name
  attr_accessor :encounter_counter, :notices_ogre, :knocked_out

  def initialize(name = 'Jane')
    @name = name
    @encounter_counter = 0
    @notices_ogre = false
    @knocked_out = false
  end

  def notices_ogre?
    (encounter_counter % 3).zero? ? true : false
  end

  def knocked_out?
    knocked_out
  end
end
