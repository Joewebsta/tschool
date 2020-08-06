require './lib/turn'

class Game
  def initialize(players)
    @player1 = players[0]
    @player2 = players[1]
  end

  def start
    5.times do
      turn = Turn.new(@player1, @player2)
      turn.pile_cards
      turn.award_spoils
      puts turn.winner.name
    end
  end
end
