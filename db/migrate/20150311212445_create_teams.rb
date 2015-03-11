class CreateTeams < ActiveRecord::Migration
  def change
    create_table(:teams) do |t|
      t.column(:name, :string)
      t.column(:location, :string)
      t.column(:wins, :int)
      t.column(:losses, :int)
      t.column(:rating, :int)

      t.timestamps
    end
  end
end
