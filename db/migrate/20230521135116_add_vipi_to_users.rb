class AddVipiToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :vipi, :integer
  end
end
