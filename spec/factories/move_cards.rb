# == Schema Information
#
# Table name: move_cards
#
#  id             :integer          not null, primary key
#  source_deck_id :integer
#  target_deck_id :integer
#  card_id        :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :move_card do
    source_deck_id 1
    target_deck_id 1
    card_id 1
  end
end
