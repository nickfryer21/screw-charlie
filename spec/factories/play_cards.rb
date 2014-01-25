# == Schema Information
#
# Table name: play_cards
#
#  id      :integer          not null, primary key
#  hand_id :integer
#  deck_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :play_card do
    hand nil
    deck nil
  end
end
