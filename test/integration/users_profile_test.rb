require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest

  include ApplicationHelper

  def setup
    @user = users(:test)
  end

  test "users profile should be displayed correctly" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', home_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_match @user.tweets.count.to_s, response.body
    assert_select 'div.pagination'
    @user.tweets.paginate(page: 1).each do |tweet|
      assert_match tweet.content, response.body
    end
  end

end
