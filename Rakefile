# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  puts 'Rubocop RakeTask not loaded'
end

begin
  require 'scss_lint/rake_task'
  SCSSLint::RakeTask.new do |t|
    t.files = Dir.glob(['app/assets'])
  end
rescue LoadError
  puts 'Scss Lint not Loaded'
end

Rails.application.load_tasks

task default: %w(rubocop scss_lint)
