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
  describe '#open' do
    let(:cards) { [Card.new(10, :spade)] }
    let(:player) { Player.new(cards) }

    subject { player.open }

    it { is_expected.to eq 10 }
  end

  describe "#buta?" do
    let(:player) { Player.new }
    subject { player.buta? }
    it { should eq false}

    context "is buta" do
      before {
        player.cards << Card.new(100, :spade)
      }

       it { expect(player.buta?).to eq true}
    end
  end
end
