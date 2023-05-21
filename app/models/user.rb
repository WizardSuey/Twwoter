# encoding: utf-8

class User < ApplicationRecord
    before_create :set_default_vip_status
    #mount_uploader :avatar, AvatarUploader
    has_many :tweets
    has_one_attached :avatar
    has_many :likes
    has_many :posts
    has_secure_password
    has_many :subscribers
    
    def avatar=(input_data)
        self.avatar_data = input_data.read
      end
    
      def avatar
        StringIO.new(avatar_data)
    end
    
    def set_default_vip_status
      self.vip ||= false
    end

    validates :email, presence: true, uniqueness: true, length: { maximum: 20 }
    validates :avatar, presence: true
    
end
