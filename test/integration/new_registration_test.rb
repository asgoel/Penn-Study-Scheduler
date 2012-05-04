require 'test_helper'

class NewRegistrationTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true

  javascript
  test "no associated course" do
    visit registrations_path
	click_link "New Registration"
    click_button "Create Registration"

	error_message = "Course can't be blank"
	assert page.has_content?(error_message)
  end
end
