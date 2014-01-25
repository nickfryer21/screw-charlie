# == Schema Information
#
# Table name: play_cards
#
#  id      :integer          not null, primary key
#  hand_id :integer
#  deck_id :integer
#

class PlayCard < ActiveRecord::Base
  belongs_to :hand
  belongs_to :deck
  has_one :player_action, :as => :action
end
