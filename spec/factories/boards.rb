# == Schema Information
#
# Table name: boards
#
#  id        :integer          not null, primary key
#  game_id   :integer
#  client_id :string(16)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :board do
    game_id 1
  end
end
