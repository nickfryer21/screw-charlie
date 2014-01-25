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

require 'arel'

class Game < ActiveRecord::Base
  has_many :game_players, :dependent => :destroy
  has_many :players, :through => :game_players
  has_one :draw_pile, :dependent => :destroy
  has_many :slots, :dependent => :destroy
  has_many :player_sessions, :dependent => :destroy

  after_create do
    self.draw_pile = DrawPile.build
  end

  def can_start?
    self.slots.all? { |slot| slot.available == false }
  end

  def start
    unless self.active
      self.start_date = DateTime.now
      deal_cards
      advance_turn
      self.active = true
      self.save!
    end
  end

  # returns the players of the active turn
  # @return [GamePlayer]
  def whose_turn
    self.advance_turn unless self.active_slot
    game_players.joins(:slot).joins(:game).where('games.active_slot = slots.sequence').first.player
  end

  def deal_cards
    self.game_players.each do |player|
      7.times do
        card = self.draw_pile.draw_card
        player.hand.cards << card
      end
    end
  end

  # @param [Slot] slot
  def add_slot(slot = nil)
    slot = Slot.create if slot.nil?
    slot.sequence = self.slots.count + 1
    self.slots << slot
  end

  # @param [Integer] count
  def add_slots(count)
    self.add_slot
  end

  # @param [Player] player
  def can_add_player?(player)
    !!self.players.include?(player) || self.slots.any? { |slot| slot.available == true }
  end

  # @param [Player] player
  def add_player(player)
    # only add players that have not already joined the current game
    unless self.players.include? player
        self.players << player
    end
  end

  def advance_turn
    # If no slot is active or we have reach the last slot start over with 1 (it is the first players turn)
    if self.active_slot.nil? || (self.active_slot == self.slots.max_by { |slot| slot.sequence }.sequence)
      self.active_slot = 1
    else
      # Move to the next slot in sequence (move to the next players turn)
      self.active_slot += 1
    end

    self.save
  end

  def play_game
    start
    winner = nil

    # A winner is declared when one of the players runs out of cards
    while winner.nil?
      self.game_players.each do |game_player|
        winner = game_player if game_player.hand.cards.empty?
      end
    end
  end

  ##
  # Finds all games for which the specified can join. A players
  # may join a game that has open slots or that players has already
  # previously joined. The game must also be currently active.
  #
  # Returns an array of games that players can joins
  #
  # @param [Player] player
  # @return [Array]
  def Game.find_available_games(player)
    gt = Game.arel_table
    st = Slot.arel_table;
    pt = GamePlayer.arel_table

    open_games = Game.find_by_sql( gt.join(st)
                                     .on(gt[:id].eq(st[:game_id]))
                                     .where(gt[:active] && st[:available])
                                     .project(gt.columns)
                                     .to_sql)

    joined_games = Game.find_by_sql(gt.join(pt)
                                      .on(gt[:id].eq(pt[:game_id]))
                                      .where(gt[:active] && pt[:player_id].eq(player.id))
                                      .project(gt.columns)
                                      .to_sql)

    available_games = (open_games + joined_games).uniq do |game|
      game.id
    end


    return available_games
  end

  def player_status
    active_player = self.whose_turn

    self.game_players.map do |p|
      {players: p.player.screen_name, active: active_player.id == p.id }
    end
  end
end
