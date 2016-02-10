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
end
