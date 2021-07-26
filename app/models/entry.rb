class Entry < ApplicationRecord
    belongs_to :user
    belongs_to :category
    validates :amount, :details, :month, presence: true


    scope :most_recent, -> {order("created_at DESC")}

    def self.search(search_term)
        if search_term
            return entry = where(details: search_term)
        else
            return Entry.all
        end
    end

  
end

