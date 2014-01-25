# == Schema Information
#
# Table name: games
#
#  id          :integer          not null, primary key
#  start_date  :datetime
#  end_date    :datetime
#  title       :string(255)
#  active_slot :integer
#  active      :boolean          default(FALSE)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    start_date '2013-01-26 12:21:20'
    end_date nil
  end
end
