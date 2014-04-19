## Put your implemntation here
suits = %i[hearts clubs diamonds spades]
ranks = %i[ace two three four five six seven eight nine ten jack queen king]
cards = ranks.flat_map {|rank| suits.map {|suit| "#{rank} of #{suit}" } }

## Tests are below
require 'minitest/autorun'

describe "a deck of cards" do

  it "must have 52 cards" do
    cards.count.must_equal 52
  end

  let(:all_hearts)  { cards.select {|card| card =~ /hearts/ } }
  it "have 13 hearts" do
    all_hearts.count.must_equal 13
  end

  let(:all_clubs)  { cards.select {|card| card =~ /clubs/ } }
  it "have 13 clubs" do
    all_clubs.count.must_equal 13
  end

  let(:all_diamonds)  { cards.select {|card| card =~ /diamonds/ } }
  it "have 13 diamonds" do
    all_diamonds.count.must_equal 13
  end

  let(:all_spades)  { cards.select {|card| card =~ /spades/ } }
  it "have 13 spades" do
    all_spades.count.must_equal 13
  end
end
