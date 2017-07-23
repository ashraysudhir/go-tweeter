class UsersController < ApplicationController

  before_action :login_check, only: [:edit, :update, :index]
  before_action :user_check, only: [:edit, :update]

  def show
    @user= User.find(params[:id])
    @tweets = @user.tweets.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_fields)
    if @user.save
      login @user
      flash[:success] = "Welcome to Go-Tweeter! Tweet On :D"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_fields)
      flash[:success] = "Profile updated successfully!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  private
  def user_fields
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_check
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end
