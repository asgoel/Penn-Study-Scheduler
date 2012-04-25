class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.belongs_to :user
      t.belongs_to :study_session

      t.timestamps
    end
    add_index :invitations, :user_id
    add_index :invitations, :study_session_id
  end
end
