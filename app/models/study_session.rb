class StudySession < ActiveRecord::Base
  belongs_to :course
  has_many :invitations
  has_many :users, :through => :invitations
  validates :course_id, :presence => true
  validates :location, :presence => true  
end
