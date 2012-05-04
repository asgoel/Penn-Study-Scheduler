class Upload < ActiveRecord::Base
  belongs_to :user
  validates :schedule_file_name, :presence => true 
end
