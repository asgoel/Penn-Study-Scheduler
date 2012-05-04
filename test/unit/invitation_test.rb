require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "No Associated StudySession" do
	attrs = {study_session_id: nil}
	inv = Invitation.new(attrs)
    assert !inv.valid?
  end
end
