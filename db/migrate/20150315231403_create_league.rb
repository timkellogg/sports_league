class CreateLeague < ActiveRecord::Migration
  def up
    create_table(:league) do |t|
      t.column(:schedule, :string)
      t.column(:teams, :string)
    end
  end
  
  def down
    drop_table(:league)
  end
end

    
