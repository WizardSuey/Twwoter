class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Запись выложена."
      redirect_to "/user/#{Current.user.id}"
    else
      flash[:alert] = "Ошибка при выкладывании записи."
      render :new
    end
  end
  
  

  def like
    @post = Post.find(params[:id])

    if Current.user.likes.exists?(post: @post)
      Current.user.likes.find_by(post: @post).destroy
      @post.decrement!(:likes_count)
      #redirect_to @post, notice: "Вы убрали лайк."
    else
      Current.user.likes.create(post: @post)
      @post.increment!(:likes_count)
      #redirect_to @post, notice: "Спасибо за лайк!"
    end
  end

  # def unlike
  #   @post = Post.find(params[:id])

  #   if Current.user.likes.exists?(post: @post)
  #     Current.user.likes.find_by(post: @post).destroy
  #     @post.decrement!(:likes_count)
  #     #redirect_to @post, notice: "Unliked."
  #   #else
  #     #redirect_to @post, alert: "You haven't liked this post yet."
  #   end
  # end

  def show
    @post = Post.find(params[:id])
    @users = User.all
    @comments = Comment.new
    @comments = Comment.all
  end


  private

  def post_params
    params.require(:post).permit(:body, :photo, :user)
  end

end
