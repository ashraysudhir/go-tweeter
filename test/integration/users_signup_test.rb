require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "signup should fail on invalid information and render new page again" do
    get signup_path

    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "  ", email: "test@test", password: "test", password_confirmation: "tests" } }
    end

    assert_template 'users/new'

    assert_select 'div#display_errors'
    assert_select 'div.alert'
    assert_select 'div.alert-danger'

  end

end
