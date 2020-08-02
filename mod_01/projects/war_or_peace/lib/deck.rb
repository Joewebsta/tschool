require './lib/card'

class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index]
  end

  def high_ranking_cards
    cards.select { |card| card.rank > 11 }
  end

  def percent_high_ranking
    ((high_ranking_cards.length / cards.length.to_f) * 100).round(2)
  end

  def remove_card
    cards.delete_at(0)
  end

  def add_card(card)
    cards << card
  end
end
