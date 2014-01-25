# == Schema Information
#
# Table name: cards
#
#  id        :integer          not null, primary key
#  rank      :integer
#  suit      :string(255)
#  sequence  :integer
#  pile_type :string(255)
#  pile_id   :integer
#  client_id :string(16)
#

require_relative '../spec_helper'

describe Card do
  describe '#to_s' do
    context 'When the card is an Ace of Hearts'do
      card = FactoryGirl.create :card
      it('returns "Ace of Hearts""') { card.to_s.should == 'Ace of Hearts' }
    end

    context 'When the card is a King of Hearts' do
      card = FactoryGirl.create :card, :rank => 13
      it('returns "King of Hearts"') { card.to_s.should == 'King of Hearts' }
    end

    context 'When the card is a Queen of Hearts'do
      card = FactoryGirl.create :card, :rank => 12
      it('Returns "Queen of Hearts""') { card.to_s.should == 'Queen of Hearts' }
    end

    context 'When the card is a Jack of Hearts'do
      card = FactoryGirl.create :card, :rank => 11
      it('Returns "Jack of Hearts"') { card.to_s.should == 'Jack of Hearts' }
    end

    context 'When the card is a 3 of Hearts'do
      card = FactoryGirl.create :card, :rank => 3
      it('Returns "3 of Hearts""') { card.to_s.should == '3 of Hearts' }
    end

    context 'When the card is a 7 of Clubs'do
      card = FactoryGirl.create :card, :rank => 7, :suit => :Clubs
      it('Returns "7 of Clubs"') { card.to_s.should == '7 of Clubs' }
    end
  end

  describe '#points' do
    context 'When the card has a rank of 1' do
      card = FactoryGirl.create :card, :rank => 1
      it('returns 15') { card.points.should == 15 }
    end

    context 'when the card has a rank of 10' do
      card = FactoryGirl.create :card, :rank => 10
      it('returns 5') { card.points.should == 5 }
    end

    context 'when the card has a rank of 11' do
      card = FactoryGirl.create :card, :rank => 11
      it('returns 10') { card.points.should == 10 }
    end
  end

  describe '::purge' do
    Card.purge
    it ('No cards exist') { Card.all.length == 0}
  end
end
