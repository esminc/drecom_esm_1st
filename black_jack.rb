require 'bundler'
Bundler.require

class Dealer
  def initialize
    @all_cards = [:spade, :heart, :clover, :daiya].map do |mark|
  	@cards = (1..13).map {|num| Card.new(num, mark) }
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
