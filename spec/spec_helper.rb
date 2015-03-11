ENV['RACK_ENV'] = 'test'
require("rspec")
require("pg")

RSpec.configure do |config|
  config.after(:each) do
    Player.all().each() do |player|
      player.destroy()
    end
  end
end

