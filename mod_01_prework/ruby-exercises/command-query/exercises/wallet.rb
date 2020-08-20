VALUES = {
  penny: 1,
  nickel: 5,
  dime: 10,
  quarter: 25,
  dollar: 100
}.freeze

class Wallet
  attr_reader :money_arr
  attr_accessor :cents

  def initialize
    @money_arr = []
    @cents = 0
  end

  def <<(money)
    money_arr << money
    self.cents = money_arr.reduce(0) { |total, money_denom| total + VALUES[money_denom] }
  end

  def take(*money)
    money.each do |money_denom|
      next unless money_arr.include?(money_denom)

      money_arr.delete_at(money_arr.index(money_denom))
      self.cents -= VALUES[money_denom]
    end
  end
end

w = Wallet.new
3.times { w << :penny }
p w.money_arr
p w.cents
