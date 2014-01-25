# == Schema Information
#
# Table name: slots
#
#  id        :integer          not null, primary key
#  game_id   :integer
#  available :boolean          default(TRUE)
#  sequence  :integer
#

require_relative '../spec_helper'

describe Slot do
  pending "add some examples to (or delete) #{__FILE__}"
end
