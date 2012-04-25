class CreateStudySessions < ActiveRecord::Migration
  def change
    create_table :study_sessions do |t|
      t.belongs_to :course
      t.date :date
      t.time :time
      t.string :location

      t.timestamps
    end
    add_index :study_sessions, :course_id
  end
end
