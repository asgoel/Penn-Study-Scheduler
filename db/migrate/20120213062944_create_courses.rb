class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :department
      t.integer :number
      t.string :section
      t.string :description

      t.timestamps
    end
  end
end
