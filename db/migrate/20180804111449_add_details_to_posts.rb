class AddDetailsToPosts < ActiveRecord::Migration[5.2]
  def change
  	add_column :posts, :writer, :text
  	add_column :posts, :pagenum, :integer
  	add_column :posts, :pickupdate, :date
  	add_column :posts, :pickuptime, :string
  end
end
