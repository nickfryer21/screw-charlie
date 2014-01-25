# == Schema Information
#
# Table name: draw_piles
#
#  id      :integer          not null, primary key
#  game_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :draw_pile do
    game nil
  end
end
