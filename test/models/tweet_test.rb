require 'test_helper'

class TweetTest < ActiveSupport::TestCase

  def setup
    @user = users(:test)
    @tweet = Tweet.new(content: "Go-Tweet!", user_id: @user.id)
  end

  test "tweet should be valid" do
    assert @tweet.valid?
  end

end
