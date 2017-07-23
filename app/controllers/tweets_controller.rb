class TweetsController < ApplicationController

  before_action :login_check, only: [:create, :destroy]

  def create
  end

  def destroy
  end

end
