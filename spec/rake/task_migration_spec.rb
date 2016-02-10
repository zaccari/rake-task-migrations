require 'spec_helper'

describe Rake::TaskMigration do
  it 'has a version number' do
    expect(Rake::Migrations::VERSION).not_to be nil
  end
end
