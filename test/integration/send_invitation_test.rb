require 'test_helper'

class SendInvitationTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "invite someone to your studysession" do
    course = Course.create(department: "CIS", number: 121, section: "001")
    visit new_course_study_session_path(course)
	fill_in "Location", with: "Moore 100A"
	click_button "Create Study session"
	click_link "Invite People to this Event"
	click_button "Create Invitation"

	logout
  end
end
