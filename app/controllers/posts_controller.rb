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
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def like
    @post = Post.find(params[:id])
    #@user = User.find(params[:id])
    if Current.user.likes.exists?(post: @post)
      Current.user.likes.find_by(post: @post).destroy
      @post.decrement!(:likes_count)
      redirect_to request.referrer
      #redirect_to @post, notice: "Вы убрали лайк."
      #redirect_back(fallback_location: root_path)
    else
      Current.user.likes.create(post: @post)
      @post.increment!(:likes_count)
      redirect_to request.referrer
      #redirect_to @post, notice: "Спасибо за лайк!"
      #redirect_back(fallback_location: root_path)
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
    params.require(:post).permit(:user, :body, :photo)
  end

end
