# == Schema Information
#
# Table name: hands
#
#  id             :integer          not null, primary key
#  game_player_id :integer
#

class Hand < ActiveRecord::Base
  has_many :cards, :as => :pile, :dependent => :destroy
  belongs_to :game_player
end
