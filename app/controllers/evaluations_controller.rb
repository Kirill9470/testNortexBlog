class EvaluationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    evaluation = Evaluation.new(evaluation_params)
    respond_to do |format|
      if evaluation.save
        format.json {render json: {score: evaluation.post.score}, status: :ok}
      else
        format.json {render json: evaluation.errors.full_messages, status: :unprocessable_entity}
      end
    end
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(:value, :post_id)
  end

end