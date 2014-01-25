class PlayerAction < ActiveRecord::Base
  belongs_to :turn
  belongs_to :action, :polymorphic => true
end
