class AddAvatarToNewTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :new_tweets, :avatar, :binary
  end
end
