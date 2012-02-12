class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :department
      t.integer :number
      t.integer :lecture
      t.integer :section
      t.string :professor

      t.timestamps
    end
  end
end
