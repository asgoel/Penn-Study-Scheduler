class Upload < ActiveRecord::Base
  has_attached_file :schedule, 
    :path => 'tmp/schedules/:id.:extension'
  belongs_to :user
  
end
