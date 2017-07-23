require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest

  def setup
      @user = users(:test)
  end

  test "login should be unsuccessful with invalid information and report" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "  ", password: "  " } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login should be successful with valid information and display accordingly" do
    get login_path
    post login_path, params: { session: { email: @user.email, password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", edit_user_path(@user)
  end

  test "logout should be successful once login was" do
    get login_path
    post login_path, params: { session: { email:    @user.email, password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", edit_user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

end
