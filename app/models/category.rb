class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :name, length: { minimum: 3, maximum: 25 }
end
