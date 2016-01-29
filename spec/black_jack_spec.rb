require_relative "../black_jack"

describe Card do
  describe "#point" do
    let(:number) {11}
    let(:mark) { :spade }
    let(:card) { Card.new(number, mark) }

    it { expect(card.point).to eq 10 }
  end
end

describe Player do
  describe "#open" do
    let(:cards) {[Card.new(10, :spade)]}
    let(:player) {Player.new(cards)}

    subject {player.open}

    it {is_expected.to eq 10}
  end

end
