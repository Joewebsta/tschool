class Centaur
  attr_reader :name, :breed
  attr_accessor :cranky, :standing, :laying

  def initialize(name, breed)
    @name = name
    @breed = breed
    @cranky = 0
    @standing = true
    @laying = false
  end

  def shoot
    self.cranky += 1

    return 'NO!' if cranky? || laying?

    'Twang!!!'
  end

  def run
    self.cranky += 1

    return 'NO!' if cranky? || laying?

    'Clop clop clop clop!!!'
  end

  def cranky?
    cranky >= 3
  end

  def standing?
    standing
  end

  def laying?
    laying
  end

  def sleep
    self.cranky = 0
    standing? ? 'NO!' : 'Night night!'
  end

  def lay_down
    self.standing = false
    self.laying = true
  end

  def stand_up
    self.standing = true
    self.laying = false
  end

  def drink_potion
    self.cranky = 0

    laying? ? 'NO!' : 'Glug glug'
  end
end
