class StudySession < ActiveRecord::Base
  belongs_to :course
  has_many :invitations
  has_many :users, :through => :invitations
end
