class PlayerSession < ActiveRecord::Base
  belongs_to :player
  belongs_to :game;

  before_create do
    # Delete any existing sessions before creating a new one for this players
    PlayerSession.where(player_id: self.player_id).delete_all
  end

  def game_player
    GamePlayer.where(game_id: self.game_id, player_id: self.player_id).first
  end

  def self.find_by_token(token)
    PlayerSession.where(token: token).first
  end
end
