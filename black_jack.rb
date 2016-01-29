require 'bundler'
Bundler.require

class A
end

describe A do
  describe "#new" do
    expect(1).to eq 1
  end

end
