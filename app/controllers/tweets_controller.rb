class TweetsController < ApplicationController

  before_action :login_check, only: [:create, :destroy]

  def create
    @tweet = current_user.tweets.build(tweet_fields)
    if @tweet.save
      flash[:success] = "Tweeted Successfully!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private
    def tweet_fields
      params.require(:tweet).permit(:content)
    end
end
