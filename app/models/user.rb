# encoding: utf-8

class User < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
    has_many :tweets
    has_one_attached :avatar
    has_many :likes
    has_many :posts
    has_secure_password


    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
    validates :avatar, presence: true
    
end
