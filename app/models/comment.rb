class Comment < ApplicationRecord
    belongs_to :post
    validates :body, presence: true, length: { minimum: 1, maximum: 200 }

    def published?
        comment_id?
    end
end
