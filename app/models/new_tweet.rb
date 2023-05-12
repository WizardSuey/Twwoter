class NewTweet < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
    validates :body, length: { minimum: 1, maximum: 600 }
    # validates :avatar, presence: true
    def published?
        new_tweet_id?
    end
end
