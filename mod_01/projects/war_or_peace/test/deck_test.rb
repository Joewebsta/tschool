require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 13)
    @cards = [@card1, @card2, @card3]

    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_it_has_cards
    assert_equal @cards, @deck.cards
  end

  def test_it_returns_rank_of_card_at_index_0
    assert_equal @card1, @deck.rank_of_card_at(0)
  end

  def test_it_returns_rank_of_card_at_index_2
    assert_equal @card3, @deck.rank_of_card_at(2)
  end

  def test_it_returns_high_ranking_cards
    assert_equal [@card1, @card3], @deck.high_ranking_cards
  end

  def test_it_returns_percentage_of_high_ranking_cards
    assert_equal 66.67, @deck.percent_high_ranking
  end

  def test_it_removes_top_card
    assert_equal @card1, @deck.remove_card
  end

  def test_it_adds_card_to_bottom_of_deck
    card4 = Card.new(:club, '5', 5)
    assert_equal @cards.push(card4), @deck.add_card(card4)
  end
end
