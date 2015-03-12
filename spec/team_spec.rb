require("spec_helper")

describe(Team) do
  
  it("has many players") do
    lakers = Team.create({:name => "Lakers", :location => "Los Angeles", :wins => 0, :losses => 0, :rating => 0})
    kobe = Player.create({:name => "Kobe Bryant", :position => "SG", :rating => 86, :age => 36, :team_id => lakers.id})
    lebron = Player.create({:name => "Lebron James", :position => "SF", :rating => 97, :age => 29, :team_id => lakers.id})
    expect(lakers.players()).to(eq([kobe, lebron]))
  end
end

