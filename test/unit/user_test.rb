require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "sample user" do
  	attrs = {first_name: "Ashutosh", last_name: "Goel", email: nil, password: "", password_confirmation: ""}
  	user = User.new(attrs)
  	debugger;1
  	assert !user.valid?
  end
end
