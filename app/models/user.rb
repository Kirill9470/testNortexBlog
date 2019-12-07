class User < ApplicationRecord
  has_many :posts
  has_many :ip_addresses
  accepts_nested_attributes_for :posts

  validates :login, presence: true
end