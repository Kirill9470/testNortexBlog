module PostService
  class << self

    def update_score post
      array_evaluations = post.evaluations.select(:value)
      score = get_average_value(array_evaluations)
      post.update_attribute(:score, score)
    end

    private

    def get_average_value(array)
      (array.sum(:value) / array.length).round
    end

  end
end