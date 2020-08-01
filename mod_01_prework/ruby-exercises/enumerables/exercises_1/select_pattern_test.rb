gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class SelectPatternTest < Minitest::Test
  def test_pick_even_numbers
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    evens = []
    numbers.each do |number|
      evens << number if number.even?
    end
    assert_equal [2, 4, 6, 8, 10], evens
  end

  def test_pick_odd_numbers
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    odds = []
    numbers.each do |number|
      odds << number if number.odd?
    end
    assert_equal [1, 3, 5, 7, 9], odds
  end

  def test_pick_words_with_three_letters
    words = %w[pill bad finger cat blue dog table red]
    selected = []
    words.each { |word| selected << word if word.length == 3 }
    assert_equal %w[bad cat dog red], selected
  end

  def test_pick_words_with_more_than_three_letters
    words = %w[pill bad finger cat blue dog table red]
    selected = []
    words.each { |word| selected << word if word.length > 3 }
    assert_equal %w[pill finger blue table], selected
  end

  def test_pick_words_ending_in_e
    words = %w[are you strike thinking belt piece warble sing pipe]
    selected = []
    words.each { |word| selected << word if word.end_with?('e') }
    assert_equal %w[are strike piece warble pipe], selected
  end

  def test_pick_words_ending_in_ing
    words = %w[bring finger drought singing bingo purposeful]
    selected = []
    words.each { |word| selected << word if word.end_with?('ing') }
    assert_equal %w[bring singing], selected
  end

  def test_pick_words_containing_e
    words = %w[four red five blue pizza purple]
    selected = []
    words.each { |word| selected << word if word.include?('e') }
    assert_equal %w[red five blue purple], selected
  end

  def test_pick_dinosaurs
    animals = %w[tyrannosaurus narwhal eel achillesaurus qingxiusaurus]
    dinosaurs = []
    animals.each { |animal| dinosaurs << animal if animal.end_with?('saurus') }
    assert_equal %w[tyrannosaurus achillesaurus qingxiusaurus], dinosaurs
  end

  def test_pick_floats
    numbers = [3, 1.4, 3.5, 2, 4.9, 9.1, 8.0]
    floats = []
    numbers.each { |num| floats << num if num.instance_of?(Float) }
    assert_equal [1.4, 3.5, 4.9, 9.1, 8.0], floats
  end

  def test_pick_arrays
    elements = ['CAT', ['dog'], 23, [56, 3, 8], 'AIMLESS', 43, 'butter']
    arrays = []
    elements.each { |el| arrays << el if el.instance_of?(Array) }
    assert_equal [['dog'], [56, 3, 8]], arrays
  end

  def test_pick_hashes
    elements = ['cat', { dog: 'fido' }, 23, { stuff: 'things' }, 'aimless', 43]
    hashes = []
    elements.each { |el| hashes << el if el.instance_of?(Hash) }
    assert_equal [{ dog: 'fido' }, { stuff: 'things' }], hashes
  end
end
