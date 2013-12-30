class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.boolean :public, default: true
      t.text :body

      t.timestamps
    end
  end
end
