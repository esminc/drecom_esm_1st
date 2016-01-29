require 'bundler'
Bundler.require

class Card
  attr_accessor :number
  attr_accessor :mark
  def initialize(number, mark)
    @number = number
    @mark = mark
  end
end

[:spade, :heart, :clover, :daiya].map do |mark|
	cards = (1..52).map do Card.new(
