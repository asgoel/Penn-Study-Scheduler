class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.belongs_to :user
      t.belongs_to :course

      t.timestamps
    end
    add_index :registrations, :user_id
    add_index :registrations, :course_id
  end
end
