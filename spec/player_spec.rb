require("spec_helper")

describe(Player) do
  it("tells which team a player is on") do
    nba = League.create({})
    cavaliers = Team.create({:name => "Cavaliers", :location => "Cleveland", :wins => 0, :losses => 0, :rating => 0, :league_id => nba.id()})
    irving = Player.create({:name => "Kyrie Irving", :position => "PG", :rating => 88, :age => 24, :team_id => cavaliers.id(), :free_agent => false, :league_id => nba.id()})
    expect(irving.team()).to(eq(cavaliers))
  end
end

  
    

