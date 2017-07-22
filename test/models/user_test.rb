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

  test "email shouldn't be longer than 60 alphabets" do
    @user.name = "t" * 61
    assert_not @user.valid?
  end

  test "correctly formatted emails should be accepted" do
    valid_emails = %w[test@test.com T+E_S-T@T.E.ST.COM TE&ST@TesT.com]
    valid_emails.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} isn't valid"
    end
  end

end
