class Post < ApplicationRecord
    mount_uploader :photo, AvatarUploader
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    
    validates :body, length: { minimum: 1, maximum: 600 }
    
end
