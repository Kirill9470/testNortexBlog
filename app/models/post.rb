class Post < ApplicationRecord
  belongs_to :user
  has_many :evaluations
  accepts_nested_attributes_for :evaluations
  attr_accessor :authors_login # При создании поста нужно передавать логин автора

  validates :title, :description, presence: true
  before_validation :search_user

  def self.get_top_on_average_rating(evaluation, limit) # топ по среднему рейтингу
    if limit.present? && evaluation.present?
      select(:title, :description).where(score: evaluation).limit(limit) if limit.present?
    else
      all
    end
  end

  private

  def search_user #поиск пользователя или его создание
    if self.user_id.blank?
      user = User.find_or_create_by(login: self.authors_login)
      self.user_id = user.id
    end
  end

end