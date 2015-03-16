class AddColumnToLeague < ActiveRecord::Migration
  def up
    add_column(:league, :players, :string)
  end
  
  def down
    remove_column(:league, :players)
  end
end
