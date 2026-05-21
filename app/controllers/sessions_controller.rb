class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Ласкаво просимо, #{user.username}!"
    else
      flash.now[:alert] = "Невірний email або пароль"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Ви вийшли з системи"
  end
end
