require 'test_helper'

class Users::InvitationsControllerTest < ActionController::TestCase
  def setup
    @user = create(:user)
    login_as @user
  end

  test "should get index" do
    get :index, username: @user.username
    assert_response :success, @response.body
  end

  test "should generate invitation code in limit" do
    session[:return_to] = '/foo'
    @user.invitation_limit = 10
    assert_difference 'Invitation.count' do
      xhr :post, :create, username: @user.username
    end
  end

  test "should not generate invitation code out of limit" do
    session[:return_to] = '/foo'
    @user.invitation_limit = 0
    assert_no_difference 'Invitation.count' do
      xhr :post, :create, username: @user.username
    end
  end
end
