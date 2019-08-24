class Users::Posts::EvaluationsController < ApplicationController
  before_action :set_user
  before_action :set_post

  def create
    @post.evaluations.new(evaluation_params)
    respond_to do |format|
      format.json {render json: @post.score}
    end
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(:value)
  end

  def set_post
    @post = @user.posts.find(params[:post_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

end