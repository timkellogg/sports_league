require("spec_helper")

describe(Player) do
  it("tells which team a player is on") do
    lakers = Team.create({:name => "Lakers", :location => "Los Angeles", :wins => 0, :losses => 0, :rating => 0})
    kobe = Player.create({:name => "Kobe Bryant", :position => "SG", :rating => 86, :age => 36, :team_id => lakers.id})
    expect(kobe.team()).to(eq(lakers))
  end  
end

  
    

