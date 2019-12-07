class EvaluationObserver < ActiveRecord::Observer
  observe :evaluation

  def after_create evaluation
    update_score_in_post(evaluation.post)
  end

  private

  def update_score_in_post post # Обновляем рейтинг поста
    evaluations_list = post.evaluations.select(:value)
    score = calculate_average(evaluations_list)
    post.update_attribute(:score, score)
  end

  def calculate_average(evaluations_list) # Считаем среднюю оценку поста
    (evaluations_list.sum(:value) / evaluations_list.length).round
  end
end