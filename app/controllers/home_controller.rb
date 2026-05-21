class HomeController < ApplicationController
  def index
    if logged_in?
      @post = current_user.posts.build
      @posts = current_user.feed.includes(:user).page(params[:page]).per(20)
      @recommended_users = User.where.not(id: current_user.following_ids + [current_user.id]).limit(5)
    else
      @posts = Post.all.includes(:user).page(params[:page]).per(20)
      @recommended_users = User.limit(5)
    end
  end
end
