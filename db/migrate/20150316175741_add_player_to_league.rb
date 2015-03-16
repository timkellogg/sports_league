class AddPlayerToLeague < ActiveRecord::Migration
  def up
    add_column(:players, :league_id, :int)
  end
  
  def down
    remove_column(:players, :league_id, :int)
  end
end


