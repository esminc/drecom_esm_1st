require 'bundler'
Bundler.require

class Game
  def initialize(players)
    @players = players
    setup
  end

  def setup_cards
    @all_cards = get_all_cards
  end

  def get_all_cards
    [:spade, :heart, :clover, :daiya].map do |mark|
      (1..13).map { |num| Card.new(num, mark) }
    end.flatten.shuffle
  end

  def setup
    setup_cards
    2.times do
      @players.each do |player|
        player.cards << deal
      end
    end
  end
  def start
    @players.each do |p|
      p.play(self)
    end
    who_is_winner
  end
  def who_is_winner
    @players.sort_by do |player|
      player.calc
    end.last
  end

  def deal
    @all_cards.pop
  end
end

class Dealer

  def setup
  end

  def deal
    @all_cards.pop
  end
end

class Player
  attr_accessor :cards

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

  def play(game)
    while want_card?
      @cards << game.deal
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
