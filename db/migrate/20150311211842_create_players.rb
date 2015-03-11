class CreatePlayers < ActiveRecord::Migration
  def change
    create_table(:players) do |t|
      t.column(:name, :string)
      t.column(:position, :string)
      t.column(:rating, :int)
      t.column(:age, :int)

      t.timestamps
    end
  end
end
