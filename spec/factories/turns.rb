# == Schema Information
#
# Table name: turns
#
#  id             :integer          not null, primary key
#  game_player_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :turn do
    player_id 1
    game_id 1
  end
end
