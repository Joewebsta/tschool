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
    assert_instance_of Player, @player
  end

  def test_it_has_a_name
    assert_equal 'Joe', @player.name
  end

  def test_it_has_not_lost_game
    refute @player.lost?
  end

  def test_it_lost_game
    @player.deck.remove_card
    @player.deck.remove_card
    @player.deck.remove_card
    assert @player.lost?
  end
end
