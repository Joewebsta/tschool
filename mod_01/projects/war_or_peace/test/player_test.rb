require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 13)
    @cards = [@card1, @card2, @card3]

    @deck = Deck.new(@cards)

    @player = Player.new('Joe', @deck)
  end

  def test_it_exists
    skip
    assert_instance_of Player, @player
  end

  def test_it_has_a_name
    skip
    assert_equal 'Joe', @player.name
  end

  def test_it_has_not_lost_game
    skip
    refute @player.has_lost?
  end

  def test_it_lost_game
    skip
    @player.deck.remove_card
    @player.deck.remove_card
    @player.deck.remove_card
    assert @player.has_lost?
  end
end
