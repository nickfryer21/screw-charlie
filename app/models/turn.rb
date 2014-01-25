# == Schema Information
#
# Table name: turns
#
#  id             :integer          not null, primary key
#  game_player_id :integer
#

class Turn < ActiveRecord::Base
  belongs_to :game_player
  has_many :player_actions, :as => :action
end
