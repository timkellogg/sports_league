require("sinatra/activerecord")
require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/player")
require("./lib/team")
require("pg")


configure(:development) do
  set(:bind, "0.0.0.0")
  set(:port, 3000)
end


get("/") do
  erb(:index)
end

#### TEAM PORTAL ####
# Main Team Page #
get("/teamportal") do
  
  # team listings / divisions
  
  erb(:teamportal)
end

# Add Team Page #
get("/addteam") do 
  
  erb(:addteam)
end

# Add Team Form Action #
post("") do
end

#### PLAYER PORTAL #### 
# Main Player Page # 
get("/playerportal") do
  
  # link for free agency (just another team)
  
  # creating/adding a player
  
  erb(:playerportal)
end

# Add Player Page # 
get("/addplayer") do
  erb(:addplayer)
end

# Add Player Form Action #
post("") do
end




