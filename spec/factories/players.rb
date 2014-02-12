# == Schema Information
#
# Table name: players
#
#  id          :integer          not null, primary key
#  screen_name :string(255)
#  password    :string(20)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    screen_name "MyString"
  end
end
