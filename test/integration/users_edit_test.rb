require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
  end

  test "Invalid edits should be unsuccessful" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "  ", email: "test@test", password: "test", password_confirmation: "tests" } }

    assert_template 'users/edit'
  end

end
