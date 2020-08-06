require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/game'

def create_cards
  [
    Card.new(:hearts, '2', 2),
    Card.new(:hearts, '3', 3),
    Card.new(:hearts, '4', 4),
    Card.new(:hearts, '5', 5),
    Card.new(:hearts, '6', 6),
    Card.new(:hearts, '7', 7),
    Card.new(:hearts, '8', 8),
    Card.new(:hearts, '9', 9),
    Card.new(:hearts, '10', 10),
    Card.new(:hearts, 'Jack', 11),
    Card.new(:hearts, 'Queen', 12),
    Card.new(:hearts, 'King', 13),
    Card.new(:hearts, 'Ace', 14),
    Card.new(:diamonds, '2', 2),
    Card.new(:diamonds, '3', 3),
    Card.new(:diamonds, '4', 4),
    Card.new(:diamonds, '5', 5),
    Card.new(:diamonds, '6', 6),
    Card.new(:diamonds, '7', 7),
    Card.new(:diamonds, '8', 8),
    Card.new(:diamonds, '9', 9),
    Card.new(:diamonds, '10', 10),
    Card.new(:diamonds, 'Jack', 11),
    Card.new(:diamonds, 'Queen', 12),
    Card.new(:diamonds, 'King', 13),
    Card.new(:diamonds, 'Ace', 14)
    # Card.new(:spades, '2', 2),
    # Card.new(:spades, '3', 3),
    # Card.new(:spades, '4', 4),
    # Card.new(:spades, '5', 5),
    # Card.new(:spades, '6', 6),
    # Card.new(:spades, '7', 7),
    # Card.new(:spades, '8', 8),
    # Card.new(:spades, '9', 9),
    # Card.new(:spades, '10', 10),
    # Card.new(:spades, 'Jack', 11),
    # Card.new(:spades, 'Queen', 12),
    # Card.new(:spades, 'King', 13),
    # Card.new(:spades, 'Ace', 14),
    # Card.new(:clubs, '2', 2),
    # Card.new(:clubs, '3', 3),
    # Card.new(:clubs, '4', 4),
    # Card.new(:clubs, '5', 5),
    # Card.new(:clubs, '6', 6),
    # Card.new(:clubs, '7', 7),
    # Card.new(:clubs, '8', 8),
    # Card.new(:clubs, '9', 9),
    # Card.new(:clubs, '10', 10),
    # Card.new(:clubs, 'Jack', 11),
    # Card.new(:clubs, 'Queen', 12),
    # Card.new(:clubs, 'King', 13),
    # Card.new(:clubs, 'Ace', 14)
  ]
end

def create_decks
  shuffled_cards = create_cards.shuffle
  deck1 = Deck.new(shuffled_cards.first(shuffled_cards / 2))
  deck2 = Deck.new(shuffled_cards.last(shuffled_cards / 2))
  [deck1, deck2]
end

def create_players
  decks = create_decks
  player1 = Player.new('Joe', decks[0])
  player2 = Player.new('Brendan', decks[1])
  [player1, player2]
end

def display_intro
  players = create_players
  puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
  puts "The players today are #{players[0].name} and #{players[1].name}."
  puts "Type 'GO' to start the game!"
  puts '------------------------------------------------------------------'
end

def collect_player_input
  loop do
    input = gets.chomp.downcase

    if input == 'go'
      game = Game.new(create_players)
      game.start
      break
    else
      puts "Type 'GO' to start the game!"
    end
  end
end

create_cards
create_decks
create_players
display_intro
collect_player_input
