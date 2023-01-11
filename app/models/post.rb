class Post < ApplicationRecord
    category = %w[Fiction Non-Fiction]

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: category }
    validate :must_have_words

    def must_have_words
        # words =~ "Won't Believe Secret Top [number] Guess"
        unless title.match?("Won't Believe Secret Top [number] Guess")
            errors.add(:title, "Title must contain key words")
        end
    end
end
