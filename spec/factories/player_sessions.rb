# == Schema Information
#
# Table name: player_sessions
#
#  id         :integer          not null, primary key
#  player_id  :integer
#  token      :string(32)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player_session do
    player nil
    token "MyString"
  end
end
