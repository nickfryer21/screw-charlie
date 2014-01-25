# == Schema Information
#
# Table name: decks
#
#  id        :integer          not null, primary key
#  board_id  :integer
#  client_id :string(16)
#

require_relative '../spec_helper'

describe Deck do
    context 'Given a deck of cards with an Ace of Hearts, Ace of Clubs and Ace of Spades' do
      deck = FactoryGirl.create :deck
      deck.add_card FactoryGirl.create :card
      deck.add_card FactoryGirl.create :card, :suit => :Clubs
      deck.add_card FactoryGirl.create :card, :suit => :Spades

      it('The deck is a book') { (deck.book?).should be_true }
      it('The deck is not a run') { (deck.run?).should be_false }
      it('The deck is worth 45 points') { deck.points.should == 45 }
    end

    context 'Given a deck of cards with an  Ace of Hearts, 2 of Hearts and 3 of Hearts' do
      deck = FactoryGirl.create :deck
      deck.add_card FactoryGirl.create :card
      deck.add_card FactoryGirl.create :card, :rank => 2
      deck.add_card FactoryGirl.create :card, :rank => 3

      it('The deck is a run') { (deck.run?).should be_true }
      it('The deck is not a book') { (deck.book?).should be_false }
      it('The deck is worth 25 points') { deck.points.should == 25 }
    end

    context 'Given a deck of cards with an Ace of Heart, 2 of Hearts, 3 of Hearts and 4 of Clubs' do
      deck = FactoryGirl.create :deck
      deck.add_card FactoryGirl.create :card
      deck.add_card FactoryGirl.create :card, :rank => 2
      deck.add_card FactoryGirl.create :card, :rank => 3
      deck.add_card FactoryGirl.create :card, :rank => 4, :suit => :Clubs

      it('The deck is not a run') {(deck.run?).should be_false}
      it('The deck is not a book') {(deck.book?).should be_false}
      it('The deck is worth 30 points') {(deck.points.should == 30)}
    end

    context 'Given a deck of cards with a 2 of Hearts and 10 of Hearts' do
      deck = FactoryGirl.create :deck
      deck.add_card FactoryGirl.create :card, :rank => 2
      deck.add_card FactoryGirl.create :card, :rank => 10

      it('The deck is not a run') {(deck.run?).should be_false}
      it('The deck is not a book') {(deck.book?).should be_false}
      it('The deck is worth 10 points') {(deck.points.should == 10)}
    end

    context 'Given a deck of cards with a 2 of Hearts and Jack of Hearts' do
      deck = FactoryGirl.create :deck
      deck.add_card FactoryGirl.create :card, :rank => 2
      deck.add_card FactoryGirl.create :card, :rank => 11

      it('The deck is not a run') {(deck.run?).should be_false}
      it('The deck is not a book') {(deck.book?).should be_false}
      it('The deck is worth 15 points') {(deck.points.should == 15)}
    end

    context 'Given a deck of cards with an Ace of Hearts, 2 of Hearts, 3 of Hearts and 4 of Hearts' do
      deck = FactoryGirl.create :deck
      deck.add_card FactoryGirl.create :card
      deck.add_card FactoryGirl.create :card, :rank => 2
      deck.add_card FactoryGirl.create :card, :rank => 3
      deck.add_card FactoryGirl.create :card, :rank => 4

      it('The deck is a run') { (deck.run?).should be_true }
      it('The deck is not a book') { (deck.book?).should be_false }
      it('The deck is worth 30 points') { deck.points.should == 30 }
    end

    context 'Given a deck of cards with a Ace of Hearts, King of Hearts and Queen of Hearts' do
      deck = FactoryGirl.create :deck
      deck.add_card FactoryGirl.create :card
      deck.add_card FactoryGirl.create :card, :rank => 12
      deck.add_card FactoryGirl.create :card, :rank => 13

      it('The deck is a run') { (deck.run?).should be_true }
      it('The deck is not a book') { (deck.book?).should be_false }
      it('The deck is worth 35 points') { deck.points.should == 35 }
    end
end
