# == Schema Information
#
# Table name: slots
#
#  id        :integer          not null, primary key
#  game_id   :integer
#  available :boolean          default(TRUE)
#  sequence  :integer
#

class Slot < ActiveRecord::Base
  belongs_to :game
  has_one :game_player
end
