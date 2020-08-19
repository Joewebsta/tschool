class RollCall
  attr_reader :names

  def initialize
    @names = []
  end

  def <<(name)
    names << name
  end

  def longest_name
    names.max_by(&:length)
  end
end
