class Users::PostsController < ApplicationController

  before_action :set_user
  before_action :set_post, except: [:index, :create, :new]

  def index
    @posts = @user.posts
  end

  def show

  end

  def new
    @post = @user.posts.new
  end

  def create
    @post = @user.posts.new(post_params)
    respond_to do |format|
      if @post.save
        format.json { render json: @post, status: :ok }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :ip_addreess)
  end

end