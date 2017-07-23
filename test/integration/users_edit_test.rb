require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
    @another_user = users(:test_another)
  end

  test "invalid edits should be unsuccessful" do
    login_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "  ", email: "test@test", password: "test", password_confirmation: "tests" } }

    assert_template 'users/edit'
  end

  test "valid edits should be successful" do
    login_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name  = "Test"
    email = "test@test.com"
    patch user_path(@user), params: { user: { name:  name, email: email, password: "", password_confirmation: "" } }
    assert_redirected_to @user
    assert_not flash.empty?
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
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

end
