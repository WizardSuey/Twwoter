class AddVip1ToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :vip1, :integer
  end
end
