# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do |f|
  factory :card do
    rank 1
    suit :Hearts
  end
end