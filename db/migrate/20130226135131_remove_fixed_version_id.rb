class RemoveFixedVersionId < ActiveRecord::Migration
  def up
    remove_index :issues, :fixed_version_id
    remove_column :issues, :fixed_version_id
  end

  def down
    add_column :issues, :fixed_version_id, :integer
    add_index :issues, :fixed_version_id
  end
end
