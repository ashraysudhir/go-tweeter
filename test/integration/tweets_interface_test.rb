require 'test_helper'

class TweetsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
  end

  test "tweets interface should function correctly" do
    login_as(@user)
    get root_path
    assert_select 'div.pagination'

    assert_no_difference 'Tweet.count' do
      post tweets_path, params: { tweet: { content: "" } }
    end

    content = "This tweet is perfect!"
    assert_difference 'Tweet.count', 1 do
      post tweets_path, params: { tweet: { content: content } }
    end

    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body

    assert_select 'a', text: 'Delete Tweet!'
    first_tweet = @user.tweets.paginate(page: 1).first
    assert_difference 'Tweet.count', -1 do
      delete tweet_path(first_tweet)
    end

    get user_path(users(:test_another))
    assert_select 'a', text: 'Delete Tweet!', count: 0
  end

end
