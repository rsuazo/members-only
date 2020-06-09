class PostsController < ApplicationController
  # before_action :require_login, only: [:new, :create]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @post = Post.new(post_params)
    if @post.save
      redirect_to new_post_path
    else
      render :new
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end

  # private
 
  # def require_login
  #   unless logged_in?
  #     flash[:error] = "You must be logged in to access this section"
  #     redirect_to new_login_url # halts request cycle
  # end

end