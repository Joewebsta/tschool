gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class NoneTest < Minitest::Test
  def test_none_are_broken
    things = %w[functional working works fixed good]
    none_broken = things.none? do |thing|
      thing == 'broken'
    end
    assert none_broken
  end

  def test_double_negative
    numbers = [9, 3, 3, 7, 6, -5, 1]
    not_none_negative = numbers.none?(&:negative?)
    refute not_none_negative
  end

  def test_none_are_negative
    numbers = [9, 3, 1, 8, 3, 3, 5]
    none_negative = numbers.none?(&:negative?)
    assert none_negative
  end

  def test_none_shall_pass
    critters = %w[elf hobbit dwarf wizard human]
    none_shall_pass = critters.none? { |critter| critter == 'orc' }
    assert none_shall_pass
  end

  def test_one_or_more_shall_pass
    phrases = ['go', 'left', 'can cross', 'shall pass', 'must stay', 'tarried']
    none_shall_pass = phrases.none? { |phrase| phrase == 'go' }
    refute none_shall_pass
  end

  def test_none_even
    numbers = [3, 9, 15, 21, 19]
    none_even = numbers.none?(&:even?)
    assert none_even
  end
end
