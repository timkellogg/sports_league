class AddColumnToPlayers < ActiveRecord::Migration
  
  def up
    add_column(:players, :free_agent, :boolean)
  end
  
  def down
    remove_column(:players, :free_agent, :boolean)
  end
end
