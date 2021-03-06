require("rspec")
require("pg")
require("sinatra/activerecord")
require("player")
require("team")
require("league")
require("game")


RSpec.configure do |config|
  config.after(:each) do
    Player.all().each() do |player|
      player.destroy()
    end
    Team.all().each() do |team|
      team.destroy()
    end
    League.all().each() do |league|
      league.destroy()
    end
    Game.all().each() do |game|
      game.destroy()
    end
  end
end

