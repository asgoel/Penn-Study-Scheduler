require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Missing Course" do
	attrs = {:course_id => nil, :user_id => 3}
	reg = Registration.new(attrs)
    assert !reg.valid?
  end
end
