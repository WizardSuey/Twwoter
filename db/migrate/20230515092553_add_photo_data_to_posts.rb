class AddPhotoDataToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :photo_data, :binary
  end
end
