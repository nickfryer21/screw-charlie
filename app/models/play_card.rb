class PlayCard < ActiveRecord::Base
  belongs_to :hand
  belongs_to :deck
  has_one :player_action, :as => :action
end
