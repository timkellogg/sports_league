class AddTeamToLeague < ActiveRecord::Migration
  def up
    add_column(:teams, :league_id, :int)
  end
  
  def down
    remove_column(:teams, :league_id, :int)
  end
end
