# == Schema Information
#
# Table name: players
#
#  id          :integer          not null, primary key
#  screen_name :string(255)
#

class Player < ActiveRecord::Base
  has_many :game_players
  has_many :games, :through => :game_players
  has_many :player_sessions

  def self.get_player_options_for_select
    Player.all.map { |player| [player.screen_name, player.id]}
  end
end