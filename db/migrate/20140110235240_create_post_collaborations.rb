class CreatePostCollaborations < ActiveRecord::Migration
  def change
    create_table :post_collaborations do |t|
      t.belongs_to :user
      t.belongs_to :post

      t.timestamps
    end
    add_index :post_collaborations, :user_id
    add_index :post_collaborations, :post_id
  end
end
