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
    @card8 = Card.new(:diamond, '3', 3)

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
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new('Joe', @deck1)
    @player2 = Player.new('Scott', @deck2)
    @turn = Turn.new(@player1, @player2)

    assert_equal :basic, @turn.type
  end

  def test_type_is_war
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new('Joe', @deck1)
    @player2 = Player.new('Scott', @deck2)
    @turn = Turn.new(@player1, @player2)

    assert_equal :war, @turn.type
  end

  def test_type_is_mutually_assured_destruction
    @deck1 = Deck.new([@card1, @card2, @card8, @card5])
    @deck2 = Deck.new([@card4, @card3, @card7, @card6])
    @player1 = Player.new('Joe', @deck1)
    @player2 = Player.new('Scott', @deck2)
    @turn = Turn.new(@player1, @player2)

    assert_equal :mutually_assured_destruction, @turn.type
  end

  def test_player1_is_winner_when_type_is_basic
    @deck1 = Deck.new([@card1, @card2, @card8, @card5])
    @deck2 = Deck.new([@card3, @card4, @card7, @card6])
    @player1 = Player.new('Joe', @deck1)
    @player2 = Player.new('Scott', @deck2)
    @turn = Turn.new(@player1, @player2)

    assert_equal @player1, @turn.winner
  end

  def test_player2_is_winner_when_type_is_basic
    @deck1 = Deck.new([@card2, @card1, @card8, @card5])
    @deck2 = Deck.new([@card4, @card3, @card7, @card6])
    @player1 = Player.new('Joe', @deck1)
    @player2 = Player.new('Scott', @deck2)
    @turn = Turn.new(@player1, @player2)

    assert_equal @player2, @turn.winner
  end

  def test_player1_is_winner_when_type_is_war
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card7, @card6])
    @player1 = Player.new('Joe', @deck1)
    @player2 = Player.new('Scott', @deck2)
    @turn = Turn.new(@player1, @player2)

    assert_equal @player1, @turn.winner
  end

  def test_player2_is_winner_when_type_is_war
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new('Joe', @deck1)
    @player2 = Player.new('Scott', @deck2)
    @turn = Turn.new(@player1, @player2)

    assert_equal @player2, @turn.winner
  end

  def test_no_winner_when_type_is_mad
    @deck1 = Deck.new([@card1, @card2, @card8, @card5])
    @deck2 = Deck.new([@card4, @card3, @card7, @card6])
    @player1 = Player.new('Joe', @deck1)
    @player2 = Player.new('Scott', @deck2)
    @turn = Turn.new(@player1, @player2)

    assert_equal 'No Winner', @turn.winner
  end

  def test_cards_sent_to_spoils_pile_when_type_is_basic
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new('Joe', @deck1)
    @player2 = Player.new('Scott', @deck2)
    @turn = Turn.new(@player1, @player2)
    spoils = [@card1, @card3]
    @turn.pile_cards

    assert_equal spoils, @turn.spoils_of_war
  end

  def test_cards_sent_to_spoils_pile_when_type_is_war
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new('Joe', @deck1)
    @player2 = Player.new('Scott', @deck2)
    @turn = Turn.new(@player1, @player2)
    spoils = [@card1, @card2, @card5, @card4, @card3, @card6]
    @turn.pile_cards

    assert_equal spoils, @turn.spoils_of_war
  end
end

## PLAYER 1
# card1 11
# card2 10
# card5 8
# card8 3

## PLAYER 2
# card3 9
# card4 11
# card6 12
# card7 3
