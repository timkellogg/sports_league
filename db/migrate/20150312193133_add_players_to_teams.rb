class AddPlayersToTeams < ActiveRecord::Migration
  def up
    add_column(:players, :team_id, :integer) # makes it belong to another table
  end
  
  def down
    remove_column(:players, :team_id, :integer) 
  end
end
