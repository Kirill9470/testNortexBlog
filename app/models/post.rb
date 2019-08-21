class Post < ApplicationRecord
  belongs_to :user
  has_many :evaluations
  accepts_nested_attributes_for :evaluations

  validates :title, :description, presence: true

  def self.get_top(evaluation, limit)
    select(:title, :description).where(score: evaluation).limit(limit) if limit.present?
  end

  def self.qwerty
    includes(:user).find_by_sql("select ip_addreess, count(distinct user_id) as count_user from posts group by ip_addreess")
  end

  private

  def q
    UserService.add_ip_address(self.user, self.ip_addreess)
  end

end