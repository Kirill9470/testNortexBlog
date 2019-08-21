class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def get_posts_top
    top = Post.get_top(params[:evaluation], params[:limit])
    respond_to do |format|
      format.json { render json: top}
    end
  end

  def get_ip
    top = IpAddress.get_ip
    respond_to do |format|
      format.json { render json: top}
    end
  end

end