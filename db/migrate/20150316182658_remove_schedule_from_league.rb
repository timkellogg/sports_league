class RemoveScheduleFromLeague < ActiveRecord::Migration
  def change
    remove_column(:league, :schedule)
  end
end
