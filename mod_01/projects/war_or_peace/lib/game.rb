require './lib/turn'

class Game
  def initialize(players)
    @player1 = players[0]
    @player2 = players[1]
  end

  def start
    (1..1_000_000).each do |turn_num|
      puts "Player 1 cards: #{@player1.deck.cards}"
      puts "Player 2 cards: #{@player2.deck.cards}"
      puts

      turn = Turn.new(@player1, @player2)
      turn.pile_cards
      turn.award_spoils
      type = turn.type

      output = "Turn #{turn_num}: "
      output += "#{turn.winner.name} won 2 cards" if type == :basic
      output += "WAR - #{turn.winner.name} won 6 cards" if type == :war
      output += '*mutually assured destruction* 6 cards removed from play' if type == :mutually_assured_destruction
      puts output
      puts
    end
  end
end
