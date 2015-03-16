class AddGamesToLeague < ActiveRecord::Migration
  def up
    add_column(:games, :league_id, :int)
  end
  
  def down
    remove_column(:games, :league_id, :int)
  end
end
