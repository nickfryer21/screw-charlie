# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'utils/token'
require 'utils/data_tools'

class SeedHelper

  attr_accessor :players

  def migrate
    DataTools.tables.each do |table|
      ActiveRecord::Base::connection.execute "truncate table #{table}"
    end

    case Rails.env
      when 'development'
        migrate_dev
      when 'test'
        migrate_test
    end

  end

  def migrate_dev
    build_players
    build_games
  end

  def migrate_test
    build_players
    build_games
    PlayerSession.create token: 'fake-token', players: Player.find(1)
  end

  def build_players
    Player.create! screen_name: 'David'
    Player.create! screen_name: 'Laura'
    Player.create! screen_name: 'Lin'
    Player.create! screen_name: 'Jaime'
    Player.create! screen_name: 'Dan'
    Player.create! screen_name: 'Jeff'
    Player.create! screen_name: 'Karen'
    Player.create! screen_name: 'Betty'
    Player.create! screen_name: 'Noalea'

    self.players = Hash[*Player.all.map { |p| [p.screen_name, p] }.flatten]
  end

  def build_games

    game1 = Game.create! start_date: Date.today,
                         title: Token.new.value

    game2 = Game.create! start_date: Date.today,
                         title: Token.new.value

    game3 = Game.create! start_date: Date.today,
                         title: Token.new.value

    game1.add_slot Slot.create!
    game1.add_slot Slot.create!
    game2.add_slot Slot.create!
    game2.add_slot Slot.create!
    game3.add_slot Slot.create!
    game3.add_slot Slot.create!
  end
end

SeedHelper.new.migrate