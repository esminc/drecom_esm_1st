require_relative '../black_jack'

describe Card do
  describe '#point' do
    let(:number) { 11 }
    let(:mark) { :spade }
    let(:card) { Card.new(number, mark) }

    it { expect(card.point).to eq 10 }
  end
end

describe Player do
  describe '#stand' do
    let(:cards) { [Card.new(10, :spade)] }
    let(:player) { Player.new(cards) }

    subject { player.stand }

    it { is_expected.to eq 10 }
  end

  describe "#bust?" do
    let(:player) { Player.new }
    subject { player.bust? }
    it { should eq false}

    context "is bust?" do
      before {
        player.cards << Card.new(100, :spade)
        player.cards << Card.new(100, :spade)
        player.cards << Card.new(100, :spade)
      }

      it { expect(player.bust?).to eq true}
    end
  end
end
