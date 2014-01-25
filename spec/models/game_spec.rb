# == Schema Information
#
# Table name: games
#
#  id          :integer          not null, primary key
#  start_date  :datetime
#  end_date    :datetime
#  title       :string(255)
#  active_slot :integer
#  active      :boolean          default(FALSE)
#

require_relative '../spec_helper'

require_relative '../../lib/utils/token'

describe Game do
  before(:all) do
    @game = FactoryGirl.create :game
    @game.add_slot(FactoryGirl.create :slot)
    @game.add_slot(FactoryGirl.create :slot)
  end

  context 'Given a game with 2 newly created slots' do
    describe 'When a game is created'
    it ('has two slots') { @game.slots.count.should == 2 }
    it ('both slots are available') do
      @game.slots.all { |slot| slot.available.should be_true }
    end

    describe '#start' do
      pending "add some examples to (or delete) #{__FILE__}"
    end

    describe '#deal_cards' do
      pending "add some examples to (or delete) #{__FILE__}"
    end

    describe '#add_slot' do
      game = FactoryGirl.create :game
      slot = FactoryGirl.create :slot
      game.add_slot(slot)

      it ('The slot is assigned to the game') { slot.game_id.should == game.id }
    end

    describe '#add_player' do
      pending "add some examples to (or delete) #{__FILE__}"
    end

    describe '#play_game' do
      pending "add some examples to (or delete) #{__FILE__}"
    end
  end

  describe '#start' do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  describe '#whose_turn' do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  describe '#deal_cards' do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  describe '#add_slot' do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  describe '#can_add_player?' do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  describe '#add_player' do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  describe '#advance_turn' do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  describe '#play_game' do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  describe  '#player_status' do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  describe '::find_available_games' do
    context 'When 3 games exist, one previously joined, one that is full, one that is empty' do
      player1 = FactoryGirl.create :player, screen_name: 'Laura'
      player2 = FactoryGirl.create :player, screen_name: 'David'
      player3 = FactoryGirl.create :player, screen_name: 'Lin'
      player4 = FactoryGirl.create :player, screen_name: 'Betty'
      game1 = FactoryGirl.create :game, start_date: Date.today, title: 'Game 1'
      game2 = FactoryGirl.create :game, start_date: Date.today, title: 'Game 2'
      game3 = FactoryGirl.create :game, start_date: Date.today, title: 'Game 3'

      game1.add_slot
      game1.add_slot
      game1.add_slot
      game1.add_player(player1)
      game1.add_player(player2)
      game1.add_player(player3)

      game2.add_slot
      game2.add_slot
      game2.add_slot
      game2.add_player(player2)
      game2.add_player(player3)
      game2.add_player(player4)

      game3.add_slot
      game3.add_slot
      game3.add_slot

      games = Game.find_available_games(player1)

      it 'The players can join game 1' do
        (games.include?(game1)).should be_true
      end

      it 'The players cannot join game 2' do
        (games.include? (game2)).should be_false
      end

      it 'The players can join game 3' do
        (games.include?(game3)).should be_true
      end


    end
  end





end
