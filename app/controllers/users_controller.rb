class UsersController < ApplicationController
  def index
    @user = User.find_by(params[:id])
  end

  def delete_post
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to "/user/#{Current.user.id}", notice: "Пост удалён успешно."
  end

  def show
   
    @comments = Comment.all
    @comments_count = @comments.size
    @posts = Post.all
    @user = User.find(params[:id])
  end
end
