require 'test_helper'

class TweetTest < ActiveSupport::TestCase

  def setup
    @user = users(:test)
    @tweet = Tweet.new(content: "Go-Tweet!", user_id: @user.id)
  end

  test "tweet should be valid" do
    assert @tweet.valid?
  end

  test "tweet should be associated with a user id" do
    @tweet.user_id = nil
    assert_not @tweet.valid?
  end

  test "content shouldn't be blank" do
   @tweet.content = "  "
   assert_not @tweet.valid?
  end

  test "content should not have more than 140 characters" do
    @tweet.content = "t" * 141
    assert_not @tweet.valid?
  end

end
