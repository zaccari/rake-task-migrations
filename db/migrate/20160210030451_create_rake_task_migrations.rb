class CreateRakeTaskMigrations < ActiveRecord::Migration[4.2]
  def change
    create_table Rake::TaskMigration.migration_table_name do |t|
      t.string :version
      t.integer :runtime
      t.datetime :migrated_on
    end
  end
end
