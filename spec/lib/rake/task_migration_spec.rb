require 'spec_helper'

describe Rake::TaskMigration do
  subject { Rake::TaskMigration }

  it 'is a module' do
    expect(subject).to be_a_kind_of Module
  end

  it 'has a version number' do
    expect(Rake::TaskMigration::VERSION).not_to be nil
  end

  describe '.config' do
    it 'yields the module' do
      expect { |b| subject.config(&b) }.to yield_control
    end
  end

  describe '.migrate' do
    it 'runs the migrator' do
      expect(Rake::TaskMigration::Migrator).to receive(:migrate)
      subject.migrate
    end
  end

  describe '.tasks' do
    let(:tasks) { [Rake::Task['migrations:test_1']] }

    it 'returns the namespaced tasks' do
      expect(subject.tasks).to eq tasks
    end
  end

  describe '.with_namespace' do
    it 'yields the namespace' do
      expect { |b| subject.config(&b) }.to yield_control
    end
  end

  describe 'configuration variables' do
    after do
      Rake::TaskMigration.migration_table_name = Rake::TaskMigration::DEFAULT_TABLE_NAME
    end

    it 'does not conflict with variables in other modules' do
      module Foo
        class << self
          mattr_accessor :migration_table_name
        end
      end

      Foo.migration_table_name = 'foos'
      Rake::TaskMigration.migration_table_name = 'bars'

      expect(Foo.migration_table_name).to eq 'foos'
      expect(Rake::TaskMigration.migration_table_name).to eq 'bars'
    end
  end
end
