# == Schema Information
#
# Table name: moves
#
#  id      :integer          not null, primary key
#  turn_id :integer
#  card_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :move do
    turn_id 1
  end
end
