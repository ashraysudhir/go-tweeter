class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def login_check
    unless logged_in?
      flash[:danger] = "Please log in to access this functionality!"
      redirect_to login_url
    end
  end

end
