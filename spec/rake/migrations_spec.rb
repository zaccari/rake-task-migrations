require 'spec_helper'

describe Rake::Migrations do
  it 'has a version number' do
    expect(Rake::Migrations::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
