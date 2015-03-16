class CreateSchedule < ActiveRecord::Migration
  def change
    create_table(:schedules) do |t|
      t.column(:game, :int)
    end
  end
end
