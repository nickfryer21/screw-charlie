# == Schema Information
#
# Table name: cards
#
#  id        :integer          not null, primary key
#  rank      :integer
#  suit      :string(255)
#  sequence  :integer
#  pile_type :string(255)
#  pile_id   :integer
#  client_id :string(16)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do |f|
  factory :card do
    rank 1
    suit :Hearts
  end
end
