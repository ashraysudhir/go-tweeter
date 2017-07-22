class UsersController < ApplicationController

  def show
    @user= User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_fields)
    if @user.save
      flash[:success] = "Welcome to Go-Tweeter! Tweet On :D"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  def user_fields
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
