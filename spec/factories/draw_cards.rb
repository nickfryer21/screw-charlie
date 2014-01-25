# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :draw_card do
    draw_pile ""
    hand nil
  end
end
