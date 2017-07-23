require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
    @another_user = users(:test_another)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "edit should be redirected when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "update should be redirected when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name, email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "edit should be redirected when logged in as wrong user" do
    login_as(@another_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "update should be redirected when logged in as wrong user" do
    login_as(@another_user)
    patch user_path(@user), params: { user: { name: @user.name, email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "index should be redirected when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

end
