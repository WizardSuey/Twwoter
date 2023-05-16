class AddPhotoDataToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :avatar_data, :binary
  end
end
