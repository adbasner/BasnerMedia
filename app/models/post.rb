class Post < ApplicationRecord
  belongs_to :user
  has_many :post_categories
  has_many :categories, through: :post_categories
  validates :title, presence: true
  validates :content, presence: true
end
