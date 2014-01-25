# == Schema Information
#
# Table name: player_sessions
#
#  id         :integer          not null, primary key
#  player_id  :integer
#  token      :string(32)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :integer
#

require 'spec_helper'

describe PlayerSession do
  pending "add some examples to (or delete) #{__FILE__}"
end
