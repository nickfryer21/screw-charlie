# == Schema Information
#
# Table name: slots
#
#  id        :integer          not null, primary key
#  game_id   :integer
#  available :boolean          default(TRUE)
#  sequence  :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :slot do
    game nil
  end
end
