class Wizard
  attr_reader :name, :bearded
  attr_accessor :rested

  def initialize(name, bearded = { bearded: true })
    @name = name
    @bearded = bearded
    @rested = 0
  end

  def bearded?
    bearded[:bearded]
  end

  def incantation(phrase)
    "sudo #{phrase}"
  end

  def rested?
    rested <= 2
  end

  def cast
    self.rested += 1
    'MAGIC MISSLE!'
  end
end
