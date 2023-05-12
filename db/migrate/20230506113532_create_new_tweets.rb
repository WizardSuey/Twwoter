class CreateNewTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :new_tweets do |t|
      t.string :user
      t.string :body
      t.integer :user_id

      t.timestamps
    end
  end
end
