# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :move_card do
    source_deck_id 1
    target_deck_id 1
    card_id 1
  end
end
