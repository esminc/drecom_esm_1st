require_relative '../black_jack'

describe Game do
  let(:players) { [Player.new, Player.new] }
  it '' do
    game = Game.new(players)

    allow(game).to receive(:get_all_cards) {
      [:spade, :heart, :clover, :daiya].map do |mark|
        (1..13).map { |num| Card.new(num, mark) }
      end.flatten
    }

    game.setup

    expect(game.start).to eq players.last
  end
end

describe Card do
  describe '#point' do
    let(:number) { 11 }
    let(:mark) { :spade }
    let(:card) { Card.new(number, mark) }

    it { expect(card.point).to eq 10 }
  end
end

describe Player do
  let(:player) { Player.new }

  describe '#stand' do
    let(:cards) { [Card.new(10, :spade)] }
    let(:player) { Player.new(cards) }

    subject { player.stand }

    it { is_expected.to eq 10 }
    context {
      let(:cards) {[1,1,10].map{|n| Card.new(n, :spade)}}
      it { is_expected.to eq 12 }
    }
    context {
      let(:cards) {[1,10].map{|n| Card.new(n, :spade)}}
      it { is_expected.to eq 21 }
    }
  end

  describe '#bust?' do
    subject { player.bust? }
    it { should eq false }

    context 'is bust?' do
      before do
        player.cards << Card.new(10, :spade)
        player.cards << Card.new(10, :spade)
        player.cards << Card.new(10, :spade)
      end

      it { expect(player.bust?).to eq true }
    end
  end

  describe 'want_card?' do
    subject { player.want_card? }
    context 'buta?' do
      before do
        player.cards << Card.new(10, :spade)
        player.cards << Card.new(10, :spade)
      end
      it { should eq false }
    end
    context 'not buta?' do
      before do
        player.cards << Card.new(10, :spade)
      end
      it { should eq true }
    end
  end
end
