gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class MapPatternTest < Minitest::Test
  def test_capitalize
    names = %w[alice bob charlie]
    capitalized_names = []
    names.each do |name|
      capitalized_names << name.capitalize
    end
    assert_equal %w[Alice Bob Charlie], capitalized_names
  end

  def test_doubles
    numbers = [1, 2, 3, 4, 5]
    doubles = []
    numbers.each { |number| doubles << number * 2 }
    assert_equal [2, 4, 6, 8, 10], doubles
  end

  def test_squares
    numbers = [1, 2, 3, 4, 5]
    squares = []
    numbers.each { |num| squares << num**2 }
    assert_equal [1, 4, 9, 16, 25], squares
  end

  def test_lengths
    names = %w[alice bob charlie david eve]
    lengths = []
    names.each { |name| lengths << name.length }
    assert_equal [5, 3, 7, 5, 3], lengths
  end

  def test_normalize_zip_codes
    numbers = [234, 10, 9119, 38_881]
    zip_codes = []
    numbers.each do |num|
      zip_codes << num.to_s.rjust(5, '0')
    end
    assert_equal %w[00234 00010 09119 38881], zip_codes
  end

  def test_backwards
    names = %w[alice bob charlie david eve]
    backwards = []
    names.each { |name| backwards << name.reverse }
    assert_equal %w[ecila bob eilrahc divad eve], backwards
  end

  def test_words_with_no_vowels
    words = %w[green sheep travel least boat]
    without_vowels = []
    words.each { |word| without_vowels << word.delete('aeiou') }
    assert_equal %w[grn shp trvl lst bt], without_vowels
  end

  def test_trim_last_letter
    animals = %w[dog cat mouse frog platypus]
    trimmed = []
    animals.each { |animal| trimmed << animal.chop }

    assert_equal %w[do ca mous fro platypu], trimmed
  end
end
