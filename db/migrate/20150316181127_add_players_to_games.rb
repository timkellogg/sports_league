class AddPlayersToGames < ActiveRecord::Migration
  def up
    add_column(:games, :player_id, :int)
  end
  
  def down
    remove(:games, :player_id, :int)
  end
end
