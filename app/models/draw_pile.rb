require 'concerns/pile_behavior'

class DrawPile < ActiveRecord::Base
  belongs_to :game
  has_many :cards, :as => :pile, :dependent => :destroy

  def self.build(shuffle = true)
    draw_pile = DrawPile.create!

    (1..13).to_a.product([:Hearts, :Clubs, :Spades, :Diamonds]).map do |c|
      draw_pile.cards << Card.create(rank: c[0], suit: c[1])
      draw_pile.cards << Card.create(rank: c[0], suit: c[1])
    end

    draw_pile.shuffle! if shuffle

    return draw_pile
  end

  def draw_card
    card = self.cards.pop
  end

  def shuffle!
    self.cards.shuffle!


    self.cards.each_with_index do |card, index|
      card.sequence = index + 1
      card.save!
    end
  end


end