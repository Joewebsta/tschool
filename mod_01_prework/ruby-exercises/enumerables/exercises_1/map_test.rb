gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class MapTest < Minitest::Test
  def test_capitalize
    names = %w[alice bob charlie]
    capitalized_names = names.map(&:capitalize)
    assert_equal %w[Alice Bob Charlie], capitalized_names
  end

  def test_doubles
    numbers = [1, 2, 3, 4, 5]
    doubles = numbers.map do |number|
      number * 2
    end
    assert_equal [2, 4, 6, 8, 10], doubles
  end

  def test_squares
    numbers = [1, 2, 3, 4, 5]
    squares = numbers.map { |num| num.pow(2) }
    assert_equal [1, 4, 9, 16, 25], squares
  end

  def test_lengths
    names = %w[alice bob charlie david eve]
    lengths = names.map(&:length)
    assert_equal [5, 3, 7, 5, 3], lengths
  end

  def test_normalize_zip_codes
    numbers = [234, 10, 9119, 38_881]
    zip_codes = numbers.map { |num| num.to_s.rjust(5, '0') }
    assert_equal %w[00234 00010 09119 38881], zip_codes
  end

  def test_backwards
    names = %w[alice bob charlie david eve]
    backwards = names.map { |name| name.reverse }
    assert_equal %w[ecila bob eilrahc divad eve], backwards
  end

  def test_words_with_no_vowels
    words = %w[green sheep travel least boat]
    without_vowels = words.map { |word| word.delete('aeiou') }
    assert_equal %w[grn shp trvl lst bt], without_vowels
  end

  def test_trim_last_letter
    animals = %w[dog cat mouse frog platypus]
    trimmed = animals.map { |animal| animal.chop }
    assert_equal %w[do ca mous fro platypu], trimmed
  end
end
