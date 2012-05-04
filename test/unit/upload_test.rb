require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "missing schedule" do
  	attrs = {schedule_file_name: nil, user_id: 3}
	upload = Upload.new(attrs)
	assert !upload.valid?
  end
end
