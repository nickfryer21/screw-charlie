# == Schema Information
#
# Table name: boards
#
#  id        :integer          not null, primary key
#  game_id   :integer
#  client_id :string(16)
#

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
