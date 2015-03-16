class AddTeamsToGames < ActiveRecord::Migration
  def up
    add_column(:games, :team_id, :int)
  end
  
  def down
    remove_column(:games, :team_id, :int)
  end
end
