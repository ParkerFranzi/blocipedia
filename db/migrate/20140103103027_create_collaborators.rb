class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.boolean :access, default: false

      t.timestamps
    end
  end
end
