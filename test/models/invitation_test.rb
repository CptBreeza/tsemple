require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  test "should generate unique code" do
    assert_not_nil create(:invitation).code
  end
end
