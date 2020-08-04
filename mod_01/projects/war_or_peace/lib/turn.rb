require './lib/deck'

class Turn
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def type
    player1_card = player1.deck.rank_of_card_at(0)
    player2_card = player2.deck.rank_of_card_at(0)

    if player1_card != player2_card
      type = :basic
    elsif player1_card == player2_card
      type = :war
    end

    type
  end
end
