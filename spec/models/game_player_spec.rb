# == Schema Information
#
# Table name: game_players
#
#  id        :integer          not null, primary key
#  game_id   :integer
#  player_id :integer
#  slot_id   :integer
#

require_relative '../spec_helper'

describe GamePlayer do

  describe "draw_card" do
    pile = DrawPile.build
    player = FactoryGirl.create :game_player
    player.draw_card(pile)
    it('Should contain 103 cards') { pile.cards.length.should == 103 }
    Card.purge
  end

end
