class DrawCard < ActiveRecord::Base
  belongs_to :hand
  belongs_to :draw_pile
  has_one :player_action, :as => :action
end
