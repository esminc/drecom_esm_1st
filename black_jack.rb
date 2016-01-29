require 'bundler'
Bundler.require

class Game
  def initialize(players)
    @dealer = Dealer.new
    @players = players
  end

  def start
    2.times do
      @players.each do |player|
        player.cards << @dealer.deal
      end
    end
    @players.each(&:play).first
  end
end

class Dealer
  def initialize
    @all_cards = [:spade, :heart, :clover, :daiya].map do |mark|
      @cards = (1..13).map { |num| Card.new(num, mark) }
    end.flatten
  end

  def deal
    hand_cards = @all_cards.pop(2)
  end
end

class Player
  attr_accessor :cards

  def initialize(cards = [])
    @cards = cards
  end

  def stand
    @cards.inject(0) do|point, card|
      point + card.point
    end
rescue
binding.pry
raise
  end

  def play
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
