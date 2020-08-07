require_relative './candy'

class Bag
  attr_reader :candies
  attr_accessor :count

  def initialize
    @count = 0
    @candies = []
  end

  def empty?
    candies.length.zero?
  end

  def <<(candy)
    candies.push(candy)
    self.count += 1
  end

  def contains?(type)
    candies.map(&:type).include?(type)
  end
end
