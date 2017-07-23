require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @tweet = tweets(:first)
  end

  test "tweet creation should be redirected when not logged in" do
    assert_no_difference 'Tweet.count' do
      post tweets_path, params: { tweet: { content: "Test!" } }
    end
    assert_redirected_to login_url
  end

end
