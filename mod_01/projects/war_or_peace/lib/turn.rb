require './lib/deck'

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []

    @p1_card1_rank = @player1.deck.rank_of_card_at(0)
    @p1_card3_rank = @player1.deck.rank_of_card_at(2)
    @p2_card1_rank = @player2.deck.rank_of_card_at(0)
    @p2_card3_rank = @player2.deck.rank_of_card_at(2)
  end

  def type
    return :basic unless @p1_card1_rank == @p2_card1_rank
    return :mutually_assured_destruction if @p1_card1_rank == @p2_card1_rank && @p1_card3_rank == @p2_card3_rank
    return :war if @p1_card1_rank == @p2_card1_rank
  end

  def winner
    return @p1_card1_rank > @p2_card1_rank ? player1 : player2 if type == :basic
    return @p1_card3_rank > @p2_card3_rank ? player1 : player2 if type == :war
    return 'No Winner' if type == :mutually_assured_destruction
  end

  def pile_cards
    if type == :basic
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card
    end

    if type == :war
      3.times { spoils_of_war << player1.deck.remove_card }
      3.times { spoils_of_war << player2.deck.remove_card }
    end
  end
end
