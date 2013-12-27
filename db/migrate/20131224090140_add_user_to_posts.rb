class AddUserToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    add_index :posts, :uder_id
  end
end
