class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @users = User.all
  end

  def create
    user = User.new(user_params)
    respond_to do |format|
      if user.save
        format.json {render json: user, status: :ok}
      else
        format.json {render json: user.errors.full_messages, status: :unprocessable_entity}
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:login)
  end

end