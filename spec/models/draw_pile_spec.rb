# == Schema Information
#
# Table name: draw_piles
#
#  id      :integer          not null, primary key
#  game_id :integer
#

require_relative '../spec_helper'

describe DrawPile do
  describe '::build' do
    pile = DrawPile.build
    it('Should contain 104 cards') { pile.cards.length.should == 104 }
    Card.purge
  end

  describe '#draw_card' do
    pile = DrawPile.build
    card = pile.draw_card
    it('Should contain 103 cards') { pile.cards.length.should == 103 }
    Card.purge
  end

  describe '#shuffle!' do

  end
end
