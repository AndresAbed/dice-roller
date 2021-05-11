require 'spec_helper'
require 'dice_roll'

describe DiceRoll do
  let(:results) { DiceRoll.new(sides: "20 6").results }
  let(:total) {results[0][:result] + results[1][:result]}

  it "params are missing" do
    expect{ DiceRoll.new }.to raise_error(ArgumentError)
  end

  it "returns the expected values" do
    expect(results[0][:description]).to eql("20-sided die")
    expect(results[0][:result].class).to eql(Integer)
    expect(results[1][:description]).to eql("6-sided die")
    expect(results[1][:result].class).to eql(Integer)
  end

  it "has the expected key" do
    expect(results[0]).to have_key(:description)
    expect(results[0]).to have_key(:result)
    expect(results[1]).to have_key(:description)
    expect(results[1]).to have_key(:result)
    expect(results[2]).to have_key(:total)
  end

  it "has a total" do
    expect(results[2][:total]).not_to be(nil)
    expect(results[2][:total].class).to eql(Integer)
    expect(results[2][:total]).to eql(total)
  end
end
