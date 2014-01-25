class Slot < ActiveRecord::Base
  belongs_to :game
  has_one :game_player
end
