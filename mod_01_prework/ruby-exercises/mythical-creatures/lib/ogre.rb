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
    self.encounter_counter += 1
    human.increment_encounter_counter
    swing_at(human) if human.notices_ogre?
  end

  def swing_at(human)
    self.swings += 1
    human.get_knocked_out if (swings % 2).zero?
  end

  def apologize(human)
    human.become_conscious
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

  def increment_encounter_counter
    self.encounter_counter += 1
  end

  def notices_ogre?
    (encounter_counter % 3).zero?
  end

  def knocked_out?
    knocked_out
  end

  def get_knocked_out
    self.knocked_out = true
  end

  def become_conscious
    self.knocked_out = false
  end
end
