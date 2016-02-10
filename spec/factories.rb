# coding: utf-8

FactoryGirl.define do
  factory :rake_task_migration do
    sequence(:version) { |n| "migrations:task_#{n}" }
    sequence(:runtime) { |n| n }
    migrated_on DateTime.now
  end
end
