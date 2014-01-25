# == Schema Information
#
# Table name: player_actions
#
#  id          :integer          not null, primary key
#  turn_id     :integer
#  action_type :string(255)
#  action_id   :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player_action do
    turn nil
    action_type "MyString"
     ""
  end
end
