class Baby
  attr_accessor :tired

  def initialize
    @tired = true
  end

  def tired?
    tired
  end

  def nap
    self.tired = false
  end
end
