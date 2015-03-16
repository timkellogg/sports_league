class RemoveTeamsFromLeague < ActiveRecord::Migration
  def change
    remove_column(:league, :teams)
    remove_column(:league, :players)
  end
end
