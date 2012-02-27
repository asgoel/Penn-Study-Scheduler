require 'test_helper'

class CourseAlgorithmsTest < ActionDispatch::IntegrationTest
  test "new course" do
    Capybara.app_host = 'localhost:3000'
    visit '/courses'
    click_link "New Course"
    fill_in "Number", with: 320
    fill_in "Section", with: "1"
    fill_in "Description", with: "Algorithms"
    click_button "Create Course"
    error_message = "Department can't be blank"
    assert page.has_content?(error_message)
  end
end
