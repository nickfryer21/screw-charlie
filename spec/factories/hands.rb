# == Schema Information
#
# Table name: hands
#
#  id             :integer          not null, primary key
#  game_player_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hand do
    game_player nil
    deck nil
  end
end
