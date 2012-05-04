require 'test_helper'

class NewStudysessionTest < ActionDispatch::IntegrationTest
	setup do
	  Course.create(department: 'CIS', number: 121, section: '001')
	end

	test "create new studysession" do
	  visit new_course_study_session_path(1)
	  click_button "Create Study session"
	  error_message = "Need a location!"
	  assert page.has_content?(error_message)
	end
end
