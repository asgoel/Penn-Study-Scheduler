class UpdateTablesForRegistrations < ActiveRecord::Migration
  def up
    add_column :users, :registrations, :registration
    add_column :courses, :registrations, :registration
  end

  def down
  end
end
