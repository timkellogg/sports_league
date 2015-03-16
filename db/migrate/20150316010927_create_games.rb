class CreateGames < ActiveRecord::Migration
  def change
    create_table(:games) do |t|
      t.column(:visiting_team, :int)
      t.column(:home_team, :int)
      t.column(:visiting_score, :int)
      t.column(:home_score, :int)
      t.column(:winner, :int)
    end
  end
end
