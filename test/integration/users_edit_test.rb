require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
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

end
