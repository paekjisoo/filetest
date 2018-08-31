class AddColToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :studentnum, :string
    add_column :users, :cash, :integer
  end
end
