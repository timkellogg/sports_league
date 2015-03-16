class RenameLeagueToLeagues < ActiveRecord::Migration
  def change
    rename_table(:league, :leagues)
  end
end
