class AddCollaboratorToPost < ActiveRecord::Migration
  def change
    add_column :posts, :collaborator_id, :integer
    add_index :posts, :collaborator_id
  end
end
