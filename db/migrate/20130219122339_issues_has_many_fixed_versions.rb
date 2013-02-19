class IssuesHasManyFixedVersions < ActiveRecord::Migration
  def up
    create_table :issues_versions, :id => false do |t|
      t.integer :issue_id, :null => false
      t.integer :version_id, :null => false
    end
    add_index :issues_versions, [:issue_id, :version_id], :unique => true
  end

  def down
    remove_index :issues_versions, [:issue_id, :version_id]
    drop_table :issues_versions
  end
end
