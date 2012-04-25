class Upload < ActiveRecord::Base
  has_attached_file :schedule, 
    :default_url => 'public/assets/rails.png',
    :path => 'public/assets/schedules/:id.:extension',
    :url => 'public/assets/schedules/:id.:extension'
  belongs_to :user
  
end
