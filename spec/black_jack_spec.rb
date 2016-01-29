require_relative "../black_jack"

describe Card do
  describe "#point" do
    let(:number) {11}
    let(:mark) { :spade }
    let(:card) { Card.new(number, mark) }

    it { expect(card.point).to eq 10 }
  end
end
