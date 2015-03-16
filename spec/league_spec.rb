require("spec_helper")

describe(League) do
  
  it("has many players") do
    lakers = Team.create({:name => "Lakers", :location => "Los Angeles", :wins => 0, :losses => 0, :rating => 0})
    lebron = Player.create({:name => "Lebron James", :position => "SF", :rating => 97, :age => 29, :team_id => lakers.id()})
    nba = League.create({:schedule => 82, :teams => "lakers", :players => "lebron"})
    expect(nba.players().to(eq[lebron]))
  end
end