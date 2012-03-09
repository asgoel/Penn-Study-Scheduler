class DropRegistrations < ActiveRecord::Migration
  def up
    drop_table :registrations
  end

  def down
  end
end
