class UsersController < ApplicationController
  before_action :require_user_logged_in!
  def index
    @user = User.find_by(params[:id])
  end

  def delete_post
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to @user, notice: "Пост удалён успешно."
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def show
    @comments = Comment.all
    @comments_count = @comments.size
    @posts = Post.all
    @user = User.find(params[:id])
  end
  
  def subscribe
    @user = User.find(params[:id])
    Current.user.subscribers.create(user_id: Current.user.id, user_id2: @user.id)
    @user.increment!(:subscribers_count)
    redirect_to request.referrer
  end

  def unsubscribe
    @user = User.find(params[:id])
    Current.user.subscribers.find_by(user_id2: @user.id).destroy
    @user.decrement!(:subscribers_count)
    redirect_to request.referrer
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: 'Ваш аккаунт удалён.'
  end

  def promote_to_vip
    @user = User.find(params[:id])
    @user.update(vip: true)
    redirect_to @user
  end
  
  def demote_from_vip
    @user = User.find(params[:id])
    @user.update(vip: false)
    redirect_to @user
  end

  private

    def user_params
        params.require(:user).permit(:subscribers_count, :user_id)
    end
end
