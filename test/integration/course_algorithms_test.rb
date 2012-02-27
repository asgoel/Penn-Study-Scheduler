require 'test_helper'

class CourseAlgorithmsTest < ActionDispatch::IntegrationTest
  test "courses" do
    visit '/'
    click_link "New Course"
    fill_in "Number", with: 320
    fill_in "Section", with: "001"
    fill_in "Description", with: "Algorithms"
    click_button "Create Course"
    error_message = "Department can't be blank"
    assert page.has_content?(error_message)
  end
end
