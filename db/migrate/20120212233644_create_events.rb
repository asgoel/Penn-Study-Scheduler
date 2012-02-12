class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.belongs_to :course

      t.timestamps
    end
    add_index :events, :course_id
  end
end
