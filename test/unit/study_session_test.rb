require 'test_helper'

class StudySessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "No Associated Course" do
	attrs = {course_id: nil, location: "Moore 100 A", time: "2000-01-01 09:39:00"}
	study = StudySession.new(attrs)
    assert !study.valid?
  end
end
