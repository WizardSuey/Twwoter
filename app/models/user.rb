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
    
    def avatar=(input_data)
    if input_data.nil?
      self[:avatar] = nil
    elsif input_data.respond_to?(:read)
      self[:avatar] = input_data.read
      self.avatar_data.content_type = input_data.content_type.chomp
    else
      logger.error("Bad image data: #{input_data.class.name}: #{input_data.inspect}")
      raise "Bad image data"
    end
  end

  def avatar
    if self[:avatar].nil?
      nil
    else
      StringIO.new(Base64.decode64(self[:avatar]))
    end
  end
end
    
end
