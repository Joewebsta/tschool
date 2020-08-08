class Pirate
  attr_reader :name, :job
  attr_accessor :cursed, :booty

  def initialize(name, job = 'Scallywag')
    @name = name
    @job = job
    @cursed = 0
    @booty = 0
  end

  def cursed?
    cursed >= 3
  end

  def commit_heinous_act
    self.cursed += 1
  end

  def rob_ship
    self.booty += 100
  end
end
