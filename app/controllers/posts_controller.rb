class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @posts = Post.get_top_on_average_rating(params[:evaluation], params[:limit])
  end

  def create
    post = Post.new(post_params)
    respond_to do |format|
      if post.save
        format.json {render json: post, status: :ok}
      else
        format.json {render json: post.errors.full_messages, status: :unprocessable_entity}
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :authors_login, :ip_address)
  end

end