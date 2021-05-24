class Category < ApplicationRecord
  has_many :entries
  has_many :users, through: :entries

  scope :category_entries, ->(c) { where(category: c) }

end
