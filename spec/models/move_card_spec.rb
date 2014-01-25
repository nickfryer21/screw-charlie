# == Schema Information
#
# Table name: move_cards
#
#  id             :integer          not null, primary key
#  source_deck_id :integer
#  target_deck_id :integer
#  card_id        :integer
#

require_relative '../spec_helper'

describe MoveCard do
=begin
  describe '#run' do
    context 'Given two non-empty decks' do
      deck1 = FactoryGirl.create :deck
      deck1.add_card FactoryGirl.create :card
      deck1.add_card FactoryGirl.create :card, :rank => 2

      deck2 = FactoryGirl.create :deck
      deck2.add_card FactoryGirl.create :card, :suit => :Clubs, :rank => 2
      deck2.add_card FactoryGirl.create :card, :rank => 1, :suit => :Clubs

      card = deck1.cards.first

      move = FactoryGirl.create :move_card,
                                :source_deck => deck1,
                                :target_deck => deck2,
                                :card => card
      move.run

      it 'The card moves from the source deck to the target deck' do
        deck2.cards.include?(card).should be_true
      end

      it 'The card is no longer part of the source deck' do
        deck1.cards.include?(card).should be_false
      end
    end
  end
=end

  describe '#card_in_source_deck?' do
    pending 'to be written'
  end
end
