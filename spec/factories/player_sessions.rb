# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player_session do
    player nil
    token "MyString"
  end
end
