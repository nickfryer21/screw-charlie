# == Schema Information
#
# Table name: draw_cards
#
#  id           :integer          not null, primary key
#  draw_pile_id :integer
#  hand_id      :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :draw_card do
    draw_pile ""
    hand nil
  end
end
