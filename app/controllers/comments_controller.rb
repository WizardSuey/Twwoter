class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = Current.user.email

    if @comment.save
      flash[:success] = "Комментарий добавлен!"
      redirect_to request.referrer
    else
      flash.now[:danger] = "Ошибка при добавлении комментария"
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user, :body, :post_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end

