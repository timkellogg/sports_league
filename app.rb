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
  @teams = Team.all()
  erb(:teamportal)
end

# Add Team Page #
get("/addteam") do 
  @teams = Team.all()
  erb(:addteam)
end

# Add Team Form Action #
post("/addteam") do
  name = params.fetch("name")
  location = params.fetch("location")
  pg = params.fetch("PG")
  sg = params.fetch("SG")
  sf = params.fetch("SF")
  pf = params.fetch("PF")
  c = params.fetch("C")
  rating = (pg.rating + sg.rating + sf.rating + pf.rating + center.rating) / 5
  @team = Team.new({:name => name, :location => location, :wins => 0, :losses => 0, :rating => rating, :players => {pg, sg, sf, pf, c} })
  @players = Player.all()
  erb(:addteam)
end

#### PLAYER PORTAL #### 
# Main Player Page # 
get("/playerportal") do
  # link for free agency (just another team)
  # creating/adding a player
  @players = Player.all() 
  erb(:playerportal)
end

# Add Player Page # 
get("/addplayer") do
  @teams = Team.all()
  erb(:addplayer)
end

# Add Player Form Action #
post("/addplayer") do
  name = params.fetch("name")
  position = params.fetch("position")
  age = params.fetch("age")
  rating = params.fetch("rating")
  team = params.fetch("team")
  @players = Player.all()
  @player = Player.new({:name => name, :position => position, :age => age, :rating => rating, :team_id => team})
  @player.save()
  erb(:playerportal)
end

# Individual Player Pages #
get("/players/:id") do
  @teams = Team.all()
  @player = Player.find(params.fetch("id").to_i)
  erb(:players)  
end

# Edit Player #
patch("/players/:id") do
  name = params.fetch("name")
  position = params.fetch("position")
  age = params.fetch("age")
  rating = params.fetch("rating")
  team = params.fetch("team")
  @teams = Team.all()
  @player = Player.find(params.fetch("id").to_i())
  @player.update({:name => name, :position => position, :age => age, :rating => rating})
  @player.save() 
  erb(:players)
end

# Remove Player #
delete("/players/:id") do
  @players = Player.all()
  @player = Player.find(params.fetch("id").to_i())
  @player.destroy()
  erb(:playerportal)
end





