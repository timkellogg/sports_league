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
  @players = Player.all()
  erb(:teamportal)
end

# Add Team Page #
get("/addteam") do 
  @players = Player.all()
  @teams = Team.all()
  erb(:addteam)
end

# Add Team Form Action #
post("/addteam") do
  name = params.fetch("name")
  location = params.fetch("location")
  player1 = Player.find(params.fetch("PG"))
  player2 = Player.find(params.fetch("SG"))
  player3 = Player.find(params.fetch("SF"))
  player4 = Player.find(params.fetch("PF"))
  player5 = Player.find(params.fetch("C"))
  rating_total_points = player1.rating() + player2.rating() + player3.rating() + player4.rating() + player5.rating()
  rating = rating_total_points / 5
  @players = Player.all()
  @team = Team.new({:name => name, :location => location, :wins => 0, :losses => 0, :rating => rating})
  @team.save()
  
  # Add player relationship; set free agent to false 
  player1.update({:team_id => @team.id(), :free_agent => false})
  player1.save()
  player2.update({:team_id => @team.id(), :free_agent => false})
  player2.save()
  player3.update({:team_id => @team.id(), :free_agent => false})
  player3.save()
  player4.update({:team_id => @team.id(), :free_agent => false})
  player4.save()
  player5.update({:team_id => @team.id(), :free_agent => false})
  player5.save()
  erb(:index)
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
  @players = Player.all()
  # Free Agent? 
  if params.fetch("free_agent")
    team = "none" 
    @player = Player.new({:name => name, :position => position, :age => age, :rating => rating, :team_id => team, :free_agent => true})
  else 
    team = params.fetch("team")
    @player = Player.new({:name => name, :position => position, :age => age, :rating => rating, :team_id => team, :free_agent => false})
  end
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