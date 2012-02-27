class Course < ActiveRecord::Base
	belongs_to :user
	validates :department, :number, :section, :description, presence: true
	validates :number, :length => {:maximum => 3}
end
