require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Test", email: "test@test.com", password: "testpwd", password_confirmation: "testpwd")
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
    valid_emails = %w[test@test.com T+E_S-T@T.E.ST.COM TE_ST@TesT.com]
    valid_emails.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test "incorrectly formatted emails should be rejected" do
    invalid_emails = %w[test@te_st.com T+E_S-&T@T.E.ST TE&ST@TesT.com.TEST TEST.COM]
    invalid_emails.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} shouldn't be valid"
    end
  end

  test "email (case-insensitive) should be unique" do
    user_two = @user.dup
    user_two.email = @user.email.upcase
    @user.save
    assert_not user_two.valid?
  end

  test "email addresses should be saved in lowercase" do
    email_test = "TeSt@TEST.coM"
    @user.email = email_test
    @user.save
    assert_equal email_test.downcase, @user.reload.email
  end

  test "passwords shouldn't be empty" do
    @user.password = @user.password_confirmation =  "  "
    assert_not @user.valid?
  end

  test "passwords' length should be more than 5" do
    @user.password = @user.password_confirmation =  "a"*5
    assert_not @user.valid?
  end

end
