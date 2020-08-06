require './lib/card'
require './lib/deck'
require './lib/player'

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
  deck1 = Deck.new(shuffled_cards.first(6))
  deck2 = Deck.new(shuffled_cards.last(7))
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
      Game.new(create_players).start
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
