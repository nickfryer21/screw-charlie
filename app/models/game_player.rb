class GamePlayer < ActiveRecord::Base
  belongs_to :game
  belongs_to :player
  has_one :hand, :dependent => :destroy
  has_many :turns, :dependent => :destroy
  belongs_to :slot

  after_create do
    self.hand = Hand.create!

    # Make sure newly added players are added to a slot
    next_slot = self.game.slots.where(available: true).first

    unless next_slot.nil?
      self.slot = next_slot
      self.save
      next_slot.available = false
      next_slot.save!
    end
  end

  def draw_card(draw_pile)
    self.hand.cards << draw_pile.draw_card
  end
end

