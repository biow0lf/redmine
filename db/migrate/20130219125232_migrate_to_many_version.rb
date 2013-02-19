class MigrateToManyVersion < ActiveRecord::Migration
  class Issue < ActiveRecord::Base
    belongs_to :fixed_version, :class_name => 'Version', :foreign_key => 'fixed_version_id'
    has_and_belongs_to_many :fixed_versions, :class_name => 'Version'
  end

  def up
    say_with_time "Migration data, this may take some time..." do
      Issue.all.each do |issue|
        issue.fixed_versions << Version.find_by_id(issue.fixed_version_id)
        issue.save!
      end
    end
  end

  def down
    say_with_time "Migration data, this may take some time..." do
      Issue.all.each do |issue|
        issue.fixed_version_id = issue.fixed_versions.first.id
        issue.save!
      end
      ActiveRecord::Base.connection.execute("TRUNCATE issues_versions")
    end
  end
end
