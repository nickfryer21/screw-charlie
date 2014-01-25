# == Schema Information
#
# Table name: move_cards
#
#  id             :integer          not null, primary key
#  source_deck_id :integer
#  target_deck_id :integer
#  card_id        :integer
#

class MoveCard < ActiveRecord::Base
  belongs_to :source_deck, :class_name => 'Deck'
  belongs_to :target_deck, :class_name => 'Deck'
  has_one :card, :as => :pile

  validates :source_deck, :presence => true
  validates :target_deck, :presence => true
  validates :card, :presence => true
  validate :card_in_source_deck

  def run
    self.source_deck.remove_card self.card
    self.target_deck.add_card self.card
  end

  def card_in_source_deck?
      self.source_deck.cards.include?(self.card)
  end
end
