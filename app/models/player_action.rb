# == Schema Information
#
# Table name: player_actions
#
#  id          :integer          not null, primary key
#  turn_id     :integer
#  action_type :string(255)
#  action_id   :integer
#

class PlayerAction < ActiveRecord::Base
  belongs_to :turn
  belongs_to :action, :polymorphic => true
end
