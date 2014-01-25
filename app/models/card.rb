# == Schema Information
#
# Table name: cards
#
#  id        :integer          not null, primary key
#  rank      :integer
#  suit      :string(255)
#  sequence  :integer
#  pile_type :string(255)
#  pile_id   :integer
#  client_id :string(16)
#

require_relative '../../lib/utils/token'

class Card < ActiveRecord::Base


  belongs_to :pile, :polymorphic => true

  validate :rank_in_range?
  validate :has_valid_suit?
  validates :rank, :presence => true
  validates :suit, :presence => true

  attr_accessor :client_id

  before_update :on_pile_changed

  RANK_MAPPING = {1 => 'Ace', 11 => 'Jack', 12 => 'Queen', 13 => 'King'}

  CARD_SUITS = [:Hearts, :Clubs, :Spades, :Diamonds]

  def client_id
    unless read_attribute(:client_id)
      write_attribute(:client_id, Token.new.value)
     self.save
    end

    read_attribute(:client_id)
  end

  def to_s
    "#{RANK_MAPPING.fetch(self.rank, self.rank.to_s)} of #{self.suit.to_s.capitalize}"
  end

  def points
    case self.rank
      when 1 then
        15
      when (11..13) then
        10
      else
        5
    end
  end

  def rank_in_range?
    unless (1..13) === self.rank
      self.errors.add(:rank, "Rank must be between 1-13")
    end
  end

  def has_valid_suit?
    unless CARD_SUITS.include? self.suit.to_sym
      self.errors.add(:base, "Never heard of that suit")
    end
  end

  def self.purge
    ActiveRecord::Base::connection.execute 'truncate table cards'
  end

  def suit_value
    {clubs: 1, spades: 2, hearts: 3, diamonds: 4}[self.suit.to_sym]
  end

  private

  def on_pile_changed
    if self.changes.include?('pile_id')
      old_pile_id = self.changes[:pile_id][0]
      new_pile_id = self.changes[:pile_id][1]

      unless old_pile_id.nil?
        old_pile = if self.changes.include?('pile_type')
                     Object.const_get(changes[:pile_type][0].to_s).find(old_pile_id)
                   else
                     Object.const_get(self.pile_type).find(new_pile_id)
                   end

        [self.pile, old_pile].each do |deck|
          deck.cards.each_with_index do |item, index|
            unless item == self
              item.sequence = index + 1
              item.save
            end
          end
        end

        self.sequence = self.pile.cards.count + 1
      end
    end
  end
end

