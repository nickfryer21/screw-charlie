class Deck < ActiveRecord::Base

  belongs_to :board
  has_many :cards, :as => :pile

  public

  def client_id
    unless read_attribute(:client_id)
      write_attribute(:client_id, Token.new.value)
      self.save
    end

    read_attribute(:client_id)
  end


  def add_card(card)
    self.cards << card
  end

  def remove_card(card)
    self.cards.delete(card)
  end

  def points
    (self.cards.blank?) ? 0 : self.cards.inject(0) do |total, card|
      total + card.points
    end
  end

  def book?
    (self.cards.length >= 3) && (self.cards.all? { |card| card.rank == self.cards.first.rank })
  end

  def playable_card?(card)

  end

  def run?
    if (self.cards.length >= 3) && (self.cards.all? { |card| card.suit == self.cards.first.suit })
      if self.ace_high_run? then
        return true
      else
        sorted = self.cards.sort { |c1, c2| c1.rank <=> c2.rank }
        rank = sorted.first.rank

        sorted.each do |card|
          return false unless rank == card.rank
          rank += 1
        end

        return true
      end
    end

    return false
  end

  protected

  def ace_high_run?
    sorted = self.cards.sort { |c1, c2| c1.rank <=> c2.rank }
    rank = sorted.first.rank
    return false unless rank == 1

    sorted.shift
    rank = sorted.first.rank

    sorted.each do |card|
      return false unless rank == card.rank
      rank += 1
    end

    return true
  end
end
