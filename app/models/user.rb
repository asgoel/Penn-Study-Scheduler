class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :registrations
  has_many :courses, :through => :registrations
  
  has_many :invitations
  has_many :study_sessions, :through => :invitations
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :uniqueness => {:case_sensitve => false}
  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
