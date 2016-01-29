require_relative '../black_jack'

describe Game do
  let(:players){ [ Player.new, Player.new ] }
  it "" do
    expect(Game.new(players).start).to eq players.first
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
  end

  describe "#bust?" do
    subject { player.bust? }
    it { should eq false}

    context "is bust?" do
      before {
        player.cards << Card.new(10, :spade)
        player.cards << Card.new(10, :spade)
        player.cards << Card.new(10, :spade)
      }

      it { expect(player.bust?).to eq true}
    end
  end

  describe "want_card?" do
    subject { player.want_card? }
    context "buta?" do
      before {
        player.cards << Card.new(10, :spade)
        player.cards << Card.new(10, :spade)
      }
      it { should eq false}
    end
    context "not buta?" do
      before {
        player.cards << Card.new(10, :spade)
      }
      it { should eq true}
    end
  end
end
