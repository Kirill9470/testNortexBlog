class EvaluationObserver < ActiveRecord::Observer
  observe :evaluation

  def after_create evaluation
    update_score_post(evaluation)
  end

  private

  def update_score_post evaluation
    evaluation_post = evaluation.post
    PostService.update_score(evaluation_post)
  end
end