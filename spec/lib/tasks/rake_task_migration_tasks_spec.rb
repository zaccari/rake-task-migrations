require 'spec_helper'
require 'rake'
load Rails.root.join('Rakefile')

describe 'Rake Tasks' do
  it 'should define rake tasks:migrate' do
    expect(Rake::Task['tasks:migrate']).to_not be nil
  end

  it 'should define rake task_migration:install:migrations' do
    expect(Rake::Task['task_migration:install:migrations']).to_not be nil
  end

  context 'raw task' do
    before { Dir.chdir 'spec/dummy' }
    after { Dir.chdir '../..' }
    it 'works' do
      output = system("bundle exec rake tasks:migrate")
      expect(output).to be true
    end
  end
end