require 'bundler'
Bundler.require

class Player
  def 
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

all_cards = [:spade, :heart, :clover, :daiya].map do |mark|
	cards = (1..13).map {|num| Card.new(num, mark) }
end
hand_cards = all_cards.pop(2)
