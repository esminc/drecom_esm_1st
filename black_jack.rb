require "active_support/all"
require 'bundler'
Bundler.require

class Game
  def initialize(players)
    @players = players
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

class Player
  attr_accessor :cards

  def initialize(cards = [])
    @cards = cards
  end

  def stand
    # 全部 10 と判断する
    is_1, not_1 = @cards.compact.partition {|e| e.number == 1 }
    min_point = is_1.count + not_1.sum(&:number)
    if is_1.count > 0 && 10 + min_point <= 21
      min_point + 10
    else
      min_point
    end
  end

  def choice_point
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
