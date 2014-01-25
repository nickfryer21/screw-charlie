class Board < ActiveRecord::Base

  belongs_to :game
  has_many :decks

  def client_id
    unless read_attribute(:client_id)
      write_attribute(:client_id, Token.new.value)
      self.save
    end

    read_attribute(:client_id)
  end

end
