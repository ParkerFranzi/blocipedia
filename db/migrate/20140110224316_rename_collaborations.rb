class RenameCollaborations < ActiveRecord::Migration
  def up
    rename_table :collaborations, :collaboration
  end

  def down
    rename_table :collaboration, :collaborations
  end
end
