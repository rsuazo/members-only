class PostsController < ApplicationController
  # before_action :require_login, only: [:new, :create]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end

  # def require_login
  #   unless logged_in?
  #     flash[:error] = "You must be logged in to access this section"
  #     redirect_to new_login_url # halts request cycle
  # end

end