class Turn < ActiveRecord::Base
  belongs_to :game_player
  has_many :player_actions, :as => :action
end
