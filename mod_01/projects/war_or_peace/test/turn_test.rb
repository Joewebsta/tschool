require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/player'
require './lib/deck'
require './lib/card'

class TurnTest < Minitest::Test
  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)

    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new('Joe', @deck1)
    @player2 = Player.new('Scott', @deck2)

    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_type_is_basic
    @deck1 = Deck.new([@card1])
    @deck2 = Deck.new([@card3])
    @player1 = Player.new('Joe', @deck1)
    @player2 = Player.new('Scott', @deck2)

    @turn = Turn.new(@player1, @player2)

    assert_equal :basic, @turn.type
  end

  def test_type_is_war; end

  def test_type_is_mutually_assured_destruction; end
end