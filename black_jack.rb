require 'bundler'
Bundler.require

class Game
  def initialize(players)
    @dealer = players[0].extend(DealerXXX)
    @players = players
  end

  def start
    @dealer.setup

    2.times do
      @players.each do |player|
        deal(player)
      end
    end

    @players.each do |p|
      p.play(@dealer)
    end
    who_is_winner
  end
  def who_is_winner
    @players.sort_by do |player|
      player.calc
    end.last
  end

  private

  def deal(player)
    player.cards << @dealer.deal
  end
end

class Dealer
  def initialize
  end

  def setup
    @all_cards = [:spade, :heart, :clover, :daiya].map do |mark|
      @cards = (1..13).map { |num| Card.new(num, mark) }
    end.flatten.shuffle
  end

  def deal
    @all_cards.pop
  end
end

class Player
  attr_accessor :cards
  attr_accessor :dealer

  def initialize(cards = [])
    @cards = cards
  end

  def stand
    @cards.flatten.inject(0) do|point, card|
      point + card.point
    end
  end

  def calc
    return -1 if bust?
    stand
  end

  def play(dealer)
    while want_card?
      @cards << dealer.deal
    end
  end

  def want_card?
    stand < 16
  end

  def bust?
    stand > 21
  end
end

class Card
  attr_accessor :number
  attr_accessor :mark
  def initialize(number, mark)
    @number = number
    @mark = mark
  end

  def point
    if number >= 11
      10
    else
      number
    end
  end
end
