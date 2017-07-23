class TweetsController < ApplicationController

  before_action :login_check, only: [:create, :destroy]
  before_action :user_check, only: :destroy

  def create
    @tweet = current_user.tweets.build(tweet_fields)
    if @tweet.save
      flash[:success] = "Tweeted Successfully!"
      redirect_to root_url
    else
      @feed_tweets = []
      render 'static_pages/home'
    end
  end

  def destroy
    @tweet.destroy
    flash[:success] = "Tweet Deleted Successfully!"
    redirect_to request.referrer || root_url
  end

  private
    def tweet_fields
      params.require(:tweet).permit(:content)
    end

    def user_check
      @tweet = current_user.tweets.find_by(id: params[:id])
      redirect_to root_url if @tweet.nil?
    end
end
