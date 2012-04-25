class Course < ActiveRecord::Base
  has_many :registrations
  has_many :users, :through => :registrations
	validates :department, :number, :section, presence: true
	validates :number, :length => {:maximum => 3}
  validates :section, :length => {:maximum => 3}
  validates :department, :length => {:maximum => 4}
  
  def full_name
    "#{department} #{number}-#{section}: #{description}"
  end
  
  def abbrev
    "#{department} #{number}-#{section}"
  end
end
