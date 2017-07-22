require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Test", email: "test@test.com")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "name shouldn't be empty" do
    @user.name = "  "
    assert_not @user.valid?
  end

  test "email shouldn't be empty" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "name shouldn't be longer than 30 alphabets" do
    @user.name = "t" * 31
    assert_not @user.valid?
  end

end
