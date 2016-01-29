require 'bundler'
Bundler.require

class Game
  def initialize
    @dealer = Dealer.new
    @players = 3.times.map do
       Player.new
    end
  end
  
  def start
    @players.each do |player|
      player.cards << @dealer.deal
    end
    @players.each do |player|
       player.play
  end
end

class Dealer
  def initialize
    @all_cards = [:spade, :heart, :clover, :daiya].map do |mark|
  	@cards = (1..13).map {|num| Card.new(num, mark) }
    end
  end

  def deal
    hand_cards = all_cards.pop(2)
  end
end

class Player
  def initialize(cards)
    @cards = cards
  end

  def open
    @cards.inject(0) {|point, card|
      point + card.point
    }
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
