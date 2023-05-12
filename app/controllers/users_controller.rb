class UsersController < ApplicationController
  def index
    @user = User.find_by(params[:id])
  end

  def show
   
    @comments = Comment.all
    @comments_count = @comments.size
    @posts = Post.all
    @user = User.find(params[:id])
  end
end
