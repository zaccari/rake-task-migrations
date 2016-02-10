require 'spec_helper'

describe Rake::TaskMigration do
  it 'is a module' do
    expect(Rake::TaskMigration).to be_a_kind_of Module
  end

  it 'has a version number' do
    expect(Rake::TaskMigration::VERSION).not_to be nil
  end
end
