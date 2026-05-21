class PostsController < ApplicationController
  before_action :require_login

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: "Пост опубліковано!"
    else
      redirect_to root_path, alert: @post.errors.full_messages.to_sentence
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: "Пост видалено"
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
