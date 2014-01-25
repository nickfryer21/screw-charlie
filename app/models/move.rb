class Move < ActiveRecord::Base
  belongs_to :turn
  has_one :card_source
  has_one :card_target
  belongs_to :card
end
