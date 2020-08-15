gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class FindUsingMaxByTest < Minitest::Test
  # You get the first test for free... it's already passing.
  def test_longest_word
    words = %w[apple banana cherry date eggplant]

    found_word = words.max_by do |word|
      word.length
    end

    assert_equal 'eggplant', found_word
  end

  # This one is missing the block inside the loop.
  def test_shortest_word
    words = %w[apple banana cherry date eggplant]

    found_word = words.max_by do |word|
      -word.length
    end

    assert_equal 'date', found_word
  end

  # This one is missing the entire loop
  def test_array_with_the_most_items
    arrays = [%i[a b c], [1, 2, 3, 4, 5], ['zoo', :things, :stuff]]

    biggest_array = arrays.max_by(&:length)

    assert_equal [1, 2, 3, 4, 5], biggest_array
  end

  # You're on your own on this one.
  def test_array_with_the_fewest_items
    arrays = [%i[a b c], [1, 2, 3, 4, 5], ['zoo', :things, :stuff]]

    smallest_array = arrays.max_by { |array| -array.to_s.length }

    assert_equal %i[a b c], smallest_array
  end

  def test_biggest_number
    numbers = [1, 10, 100, 1000, 10_000, 1_000_000]

    found = numbers.max_by { |number| number.to_s.length }

    assert_equal 1_000_000, found
  end

  def test_smallest_number
    numbers = [1, 10, 100, 1000, 10_000, 1_000_000]

    found = numbers.max_by(&:size)

    assert_equal 1, found
  end

  def test_most_programmers
    programmers = { ruby: %w[katrina sandi jim aaron desi], java: %w[abby jon susan] }
    most_programmers = programmers.max_by { |lang| lang[1].length }

    assert_equal :ruby, most_programmers.first
  end

  def test_fewest_programmers
    programmers = { ruby: %w[katrina sandi jim aaron desi], java: %w[abby jon susan] }

    fewest_programmers = programmers.max_by { |lang| -lang[1].length }
    # write code here

    assert_equal :java, fewest_programmers.first
  end
end
