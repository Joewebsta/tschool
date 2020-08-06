require './lib/card'
require './lib/deck'

def create_cards
  [
    Card.new(:heart, '2', 2),
    Card.new(:heart, '3', 3),
    Card.new(:heart, '4', 4),
    Card.new(:heart, '5', 5),
    Card.new(:heart, '6', 6),
    Card.new(:heart, '7', 7),
    Card.new(:heart, '8', 8),
    Card.new(:heart, '9', 9),
    Card.new(:heart, '10', 10),
    Card.new(:heart, 'Jack', 11),
    Card.new(:heart, 'Queen', 12),
    Card.new(:heart, 'King', 13),
    Card.new(:heart, 'Ace', 14)
  ]
end

def create_decks
  shuffled_cards = create_cards.shuffle
  half_shuffled_cards = shuffled_cards.length / 2
  deck1 = shuffled_cards.first(half_shuffled_cards).length
  deck2 = shuffled_cards.last(half_shuffled_cards).length
  [deck1, deck2]
end

create_cards
create_decks
