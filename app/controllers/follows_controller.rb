class FollowsController < ApplicationController
  before_action :require_login

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user_path(user)
  end

def destroy
  # Оскільки параметр називається :id, беремо саме його
  user = User.find(params[:id])
  current_user.unfollow(user)
  redirect_to user_path(user), status: :see_other # :see_other рекомендується для DELETE запитів у Rails 7+
end
end
