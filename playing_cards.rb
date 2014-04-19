## Put your implemntation here

## Tests are below
require 'minitest/autorun'

describe "a deck of cards" do

  it "must have 52 cards" do
    skip
    cards.count.must_equal 52
  end

  let(:all_hearts)  { cards.select {|card| card =~ /hearts/ } }
  it "have 13 hearts" do
    skip
    all_hearts.count.must_equal 13
  end

  let(:all_clubs)  { cards.select {|card| card =~ /clubs/ } }
  it "have 13 clubs" do
    skip
    all_clubs.count.must_equal 13
  end

  let(:all_diamonds)  { cards.select {|card| card =~ /diamonds/ } }
  it "have 13 diamonds" do
    skip
    all_diamonds.count.must_equal 13
  end

  let(:all_spades)  { cards.select {|card| card =~ /spades/ } }
  it "have 13 spades" do
    skip
    all_spades.count.must_equal 13
  end
end
