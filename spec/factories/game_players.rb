# == Schema Information
#
# Table name: game_players
#
#  id        :integer          not null, primary key
#  game_id   :integer
#  player_id :integer
#  slot_id   :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game_player do
    game_id 1
    player_id 1
  end
end
