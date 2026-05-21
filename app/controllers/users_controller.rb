class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Акаунт створено!"
    else
      render :new
    end
  end

  def show
    @user  = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :bio)
  end
end
