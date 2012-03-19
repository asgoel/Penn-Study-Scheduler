class Course < ActiveRecord::Base
  has_many :registrations
  has_many :users, :through => :registrations
	validates :department, :number, :section, :description, presence: true
	validates :number, :length => {:maximum => 3}
  
  def full_name
    "#{department} #{number}-#{section}: #{description}"
  end
end
