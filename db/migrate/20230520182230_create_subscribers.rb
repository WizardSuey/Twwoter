class CreateSubscribers < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribers do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :user_id2
      t.timestamps
    end
  end
end
