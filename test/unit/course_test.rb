require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "missing department" do
    ashu = User.find_by_id(3)
    attrs = {department: nil, number: 320, section: "1", description: "Algorithms", user:ashu}
    algorithms = Course.new(attrs)
    assert !algorithms.valid?
  end
end
