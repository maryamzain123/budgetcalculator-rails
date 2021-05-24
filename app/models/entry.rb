class Entry < ApplicationRecord
    belongs_to :user
    belongs_to :category
    validates :amount, :details, :month, presence: true

    
  scope :month_entries, ->(m) { where(month: m) }


  
end

