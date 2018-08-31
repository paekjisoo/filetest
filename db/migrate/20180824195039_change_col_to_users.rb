class ChangeColToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :cash, :integer, :default => 200
  end
end
