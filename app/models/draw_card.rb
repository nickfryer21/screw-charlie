# == Schema Information
#
# Table name: draw_cards
#
#  id           :integer          not null, primary key
#  draw_pile_id :integer
#  hand_id      :integer
#

class DrawCard < ActiveRecord::Base
  belongs_to :hand
  belongs_to :draw_pile
  has_one :player_action, :as => :action
end
