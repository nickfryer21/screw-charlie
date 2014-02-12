desc 'test task'
task :create_player => :environment do |t, args|
  screen_name = ENV['screen_name']
  Player.create screen_name: screen_name, password: "#{screen_name.to_s.downcase}1"
end
