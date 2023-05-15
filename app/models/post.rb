class Post < ApplicationRecord
    #mount_uploader :photo, PhotoUploader
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    validates :body, length: { minimum: 1, maximum: 600 }

    def photo=(input_data)
        self.photo_data = input_data.read
      end
    
      def photo
        StringIO.new(photo_data)
    end
end
