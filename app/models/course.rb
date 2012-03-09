class Course < ActiveRecord::Base
  has_many :registrations
  has_many :users, :through => :registrations
	validates :department, :number, :section, :description, presence: true
	validates :number, :length => {:maximum => 3}
end
