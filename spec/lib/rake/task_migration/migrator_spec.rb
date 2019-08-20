require 'spec_helper'

describe Rake::TaskMigration::Migrator do
  subject { Rake::TaskMigration::Migrator }

  let(:tasks)    { [Rake::Task['migrations:test_1']] }
  let(:migrator) { subject.new(tasks) }

  describe '#migrate' do
    it 'loads the migration tasks and calls invoke on them' do
      tasks.each do |task|
        expect(task).to receive(:invoke)
      end
      migrator.migrate
    end

    it 'creates a rake task migration record' do
      expect { migrator.migrate }.to change { RakeTaskMigration.count }.by(1)
    end

    context 'when the tasks have already been migrated' do
      before do
        tasks.each do |task|
          FactoryBot.create(:rake_task_migration, version: task.name)
        end
      end

      it 'does not invoke them' do
        tasks.each do |task|
          expect(task).to_not receive(:invoke)
        end
        migrator.migrate
      end
    end

    context 'when attempting to re-migrate tasks' do
      before { migrator.migrate }

      it 'throws an exception' do
        expect { migrator.migrate }.to raise_error(/has already been migrated/)
      end
    end
  end

  describe '.migrate' do
    it 'runs a migration for the given tasks' do
      expect_any_instance_of(subject).to receive(:migrate)
      subject.migrate(tasks)
    end
  end

  describe '.get_all_tasks' do
    it 'returns a list of tasks already migrated' do
      tasks = FactoryBot.create_list(:rake_task_migration, 2).map(&:version)
      expect(subject.get_all_tasks).to eq tasks.sort
    end
  end
end
