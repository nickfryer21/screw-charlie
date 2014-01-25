# == Schema Information
#
# Table name: decks
#
#  id        :integer          not null, primary key
#  board_id  :integer
#  client_id :string(16)
#

# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do |f|
  factory :deck do
    #cards { Array.new(3) { |rank| FactoryGirl.create :card, rank: rank + 1 }}
  end
end

