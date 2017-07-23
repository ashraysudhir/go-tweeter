class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @tweet = current_user.tweets.build
      @feed_tweets = current_user.feed.paginate(page: params[:page])
    end
  end

  def contactus
  end

  def about
  end
end
