class RakeTaskMigration < ActiveRecord::Base
  self.table_name = Rake::TaskMigration.migration_table_name

  validates :version, :runtime, :migrated_on, presence: true
end
