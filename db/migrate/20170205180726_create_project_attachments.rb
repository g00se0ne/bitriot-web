class CreateProjectAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :project_attachments do |t|
      t.belongs_to :project

      t.integer :attachable_id
      t.string :attachable_type
      t.timestamps
    end

    add_index :project_attachments, [:attachable_id, :attachable_type]
  end
end
