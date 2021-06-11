class Category < ApplicationRecord
  has_many :entries
  has_many :users, through: :entries

  scope :category_sort, -> { order("name") }

end
