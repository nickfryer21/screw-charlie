class Hand < ActiveRecord::Base
  has_many :cards, :as => :pile, :dependent => :destroy
  belongs_to :game_player
end
